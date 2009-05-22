package com.amb.wikishare.helper;

import javax.servlet.http.HttpServletRequest;

public class WikiShareHelper {

    // action GET/POST parameter
    public static final String ACTION_PARAM = "action";
    public static final String UPDATE_PARAM = "update";
    public static final String DELETE_PARAM = "delete";
    public static final String SEARCH_PARAM = "search_text";
    public static final String SIGNATURE_PARAM = "signature";
    public static final String OBJECT_ID_PARAM = "object_id";
    public static final int ERROR_PAGE_ID = 1;
    public static final String PAGE = "page";
    public static final String USER = "user";
    public static final String LOGIN = "login";
    public static final String LOGOUT = "logout";
    public static final String USERNAME = "username";
    public static final String PASSWORD = "password";
    public static final String CLIPBOARD = "clipboard";


    public static String getWabappContext(HttpServletRequest request) {
        return request.getContextPath() +
            request.getSession().getServletContext()
                .getInitParameter("webappPrefix");
    }


    /**
     * Get the last uri resource without any params.
     *
     * /WikiShare/wiki/wikipage/123?action=update would provide 123
     *
     * @param request
     * @return resource
     */
    public static String getLastUriResource(HttpServletRequest request) {

        String requestUri = request.getRequestURI();

        // check if parameter available in the request
        int requestUriEnd = requestUri.length();
        if (requestUri.indexOf("?") != -1) {
            requestUriEnd = requestUri.indexOf("?");
        }

        String pageIdOrSignature = requestUri.substring(
                requestUri.lastIndexOf("/") + 1,
                requestUriEnd);

        return pageIdOrSignature;
    }
}
