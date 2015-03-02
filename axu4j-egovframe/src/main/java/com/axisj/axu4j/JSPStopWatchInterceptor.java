package com.axisj.axu4j;

import org.apache.commons.lang3.time.StopWatch;
import org.slf4j.*;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by HJ.Park on 2015-03-02.
 */
public class JSPStopWatchInterceptor extends HandlerInterceptorAdapter {

    private Logger logger = LoggerFactory.getLogger(JSPStopWatchInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {

        if (logger.isInfoEnabled()) {
            StopWatch stopWatch = new StopWatch();
            stopWatch.start();

            request.setAttribute("stopWatch", stopWatch);
        }

        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

        if (logger.isInfoEnabled()) {

            StopWatch stopWatch = (StopWatch) request.getAttribute("stopWatch");
            if (stopWatch == null) { return; }

            stopWatch.stop();
            logger.info("{} Elapsed Time: {}ms", request.getRequestURI(), stopWatch.getTime());
        }

    }
}
