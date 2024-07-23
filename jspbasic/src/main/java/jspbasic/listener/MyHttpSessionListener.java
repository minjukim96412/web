package jspbasic.listener;

import java.util.concurrent.atomic.AtomicInteger;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MyHttpSessionListener implements HttpSessionListener {
    private static final AtomicInteger activeSessions = new AtomicInteger();

    public static int getActiveSessions() {
        return activeSessions.get();
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("세션 생성됨! 현재 세션 수: " + activeSessions.incrementAndGet());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("세션 소멸됨! 현재 세션 수: " + activeSessions.decrementAndGet());
    }
}

