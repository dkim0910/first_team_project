package db.make.jsoup;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Make_DB_Jsoup {

    public static void main(String[] args) {
        String baseURL = "https://www.musinsa.com/products/"; // 제품 URL
        int startNum = 4316816; // 제품 ID의 시작 번호	/ @@@ 변경 금지 @@@
        int stratNum2 = 4307469; // 제품 ID의 시작 번호2 / 뷰티 카테고리의 상품 시작 번호 // 이걸로 시작???

        // 데이터베이스 연결 변수
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // Oracle 데이터베이스 URL
        String user = "pj"; // 사용자명
        String password = "pj"; // 비밀번호

        try (Connection conn = DriverManager.getConnection(jdbcUrl, user, password)) {
            System.out.println("데이터베이스에 연결되었습니다.");

//          000개를 조회후 DB에 insert
            int i_start = 0;
            int i_end = 1000;
            for (int i = i_start; i < i_end; i++) {
                int currentNum = stratNum2 + i;
                String productURL = baseURL + currentNum;

                try {
                    Document doc = Jsoup.connect(productURL).get();

                    // 메타 태그 값 추출
                    String brand = doc.select("meta[property=product:brand]").attr("content");
                    String priceAmount = doc.select("meta[property=product:price:amount]").attr("content");
                    String normalPrice = doc.select("meta[property=product:price:normal_price]").attr("content");
                    String saleRate = doc.select("meta[property=product:price:sale_rate]").attr("content");
                    String imageUrl = doc.select("meta[property=og:image]").attr("content"); // 이미지 URL 추출
                    // 카테고리 및 서브 카테고리 불러오기
                    String ogDescription = doc.select("meta[property=og:description]").attr("content"); // og:description 추출

                    // "ALL 제품 : " 뒤의 내용 추출
                    String productName = "";
                    if (ogDescription.contains("ALL 제품 : ")) {
                        String[] parts = ogDescription.split("ALL 제품 : ");
                        if (parts.length > 1) {
                            productName = parts[1].trim().split(" - ")[0]; // " - " 앞부분이 제품 이름
                        }
                    } else if (ogDescription.contains("제품 : ")) {
                        String[] parts = ogDescription.split("제품 : ");
                        if (parts.length > 1) {
                            productName = parts[1].trim().split(" - ")[0]; // " - " 앞부분이 제품 이름
                        }
                    }
                    
                    // 제품분류(뷰티 등) 추출
                    String category = "";
                    if (ogDescription.contains("제품분류 : ")) {
                        String[] parts = ogDescription.split("제품분류 : ");
                        if (parts.length > 1) {
                            category = parts[1].split(">")[0].trim(); // '뷰티'만 추출
                        }
                    }
                    
                 // content 속성 값에서 "제품분류 : " 뒤의 값을 추출
                    String subCategory = "";
                    if (ogDescription.contains("제품분류 : ")) {
                        String[] parts = ogDescription.split("제품분류 : ");
                        if (parts.length > 1) {
                            // '브랜드 : '가 나타나기 전까지의 텍스트 추출
                            String categoryPart = parts[1].split("브랜드 :")[0].trim(); 
                            // '>'로 구분해서 마지막 카테고리인 '스킨케어'만 추출
                            String[] categories = categoryPart.split(">");
                            if (categories.length > 1) {
                                subCategory = categories[1].trim(); // '스킨케어' 추출
                            }
                        }
                    }
                    
                    // 가격 값이 비어 있지 않은지 확인하고 변환
                    int priceAmountInt = !priceAmount.isEmpty() ? Integer.parseInt(priceAmount) : 0;
                    int normalPriceInt = !normalPrice.isEmpty() ? Integer.parseInt(normalPrice) : 0;

                    // 제품 이름의 첫 7자리 중복 확인
                    String productNamePrefix = productName.length() >= 10 ? productName.substring(0, 10) : productName;
                    if (isProductPrefixExists(conn, productNamePrefix)) {
                        System.out.println("제품 이름의 첫 10자리가 이미 존재합니다: " + productNamePrefix + " - 건너뜁니다.");
                        continue; // 다음 제품으로 건너뛰기
                    }

                    // 데이터베이스에 삽입
                    String sql = "INSERT INTO products (product_id, brand, product_name, price_amount, normal_price, sale_rate, image_url, CATEGORY, subCategory) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                        pstmt.setInt(1, currentNum);
                        pstmt.setString(2, brand);
                        pstmt.setString(3, productName); // 제품 이름 삽입
                        pstmt.setInt(4, priceAmountInt); // 소수점 없는 정수형으로 삽입
                        pstmt.setInt(5, normalPriceInt); // 소수점 없는 정수형으로 삽입
                        pstmt.setString(6, saleRate); // 세일 비율
                        pstmt.setString(7, imageUrl); // 이미지 URL 삽입
                        pstmt.setString(8, category);
                        pstmt.setString(9, subCategory);
                        pstmt.executeUpdate(); // 데이터 삽입 실행
                    }

                    // 추출한 값 출력
                    System.out.println("제품 ID: " + currentNum);
                    System.out.println("브랜드: " + brand);
                    System.out.println("제품 이름: " + productName);
                    System.out.println("가격: " + priceAmount);
                    System.out.println("정상 가격: " + normalPrice);
                    System.out.println("세일 비율: " + saleRate + "%");
                    System.out.println("이미지 URL: " + imageUrl);
                    System.out.println("카테고리: " + category);
                    System.out.println("세부 카테고리: " + subCategory);
                    System.out.println("---------------------------");

                } catch (IOException e) {
                    System.err.println("URL 가져오기 오류: " + productURL);
                    e.printStackTrace();
                }
            }
            
            System.out.println("DB Insert Finished");
            
        } catch (SQLException e) {
            System.err.println("데이터베이스 연결 오류");
            e.printStackTrace();
        }
    }

    // 제품 이름의 첫 10자리가 데이터베이스에 존재하는지 확인하는 메소드
    private static boolean isProductPrefixExists(Connection conn, String productNamePrefix) throws SQLException {
        String sql = "SELECT COUNT(*) FROM products WHERE product_name LIKE ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, productNamePrefix + "%");
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // 제품명이 존재하면 true 반환
            }
        }
        return false; // 제품명이 존재하지 않으면 false 반환
    }
}
