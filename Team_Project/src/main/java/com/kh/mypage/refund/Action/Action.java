package com.kh.mypage.refund.Action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Action {
    ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
