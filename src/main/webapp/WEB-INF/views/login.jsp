<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/login.css" />
  </head>
  <body class="login-page">
    <div class="login-shell">
      <section class="auth-panel">
        <div class="auth-card">
          <div class="brand-lockup">
            <span class="brand-mark" aria-hidden="true"></span>
            <span>Project Management System</span>
          </div>

          <div class="auth-head">
            <p class="eyebrow">Secure access</p>
            <h1>Đăng nhập</h1>
            <p>Tiếp tục vào không gian quản lý công việc của bạn.</p>
          </div>

          <form action="${ctx}/login" method="post" class="auth-form">
            <div class="field-group">
              <label for="email">Email</label>
              <div class="input-wrap">
                <span class="input-icon email-icon" aria-hidden="true"></span>
                <input
                  id="email"
                  type="email"
                  name="email"
                  placeholder="name@company.com"
                  value="${not empty email ? email : '' }"
                  required
                />
              </div>
            </div>

            <div class="field-group">
              <label for="password">Mật khẩu</label>
              <div class="input-wrap password-wrap">
                <span class="input-icon lock-icon" aria-hidden="true"></span>
                <input id="password" type="password" name="password" placeholder="Nhập mật khẩu" required />
                <button
                  id="togglePassword"
                  class="toggle-password"
                  type="button"
                  aria-label="Hiện mật khẩu"
                  aria-pressed="false"
                >
                </button>
              </div>
            </div>

            <label class="remember-wrap">
              <input type="checkbox" name="remember" />
              <span>Nhớ mật khẩu</span>
            </label>

            <c:if test="${not empty loginResult}">
              <div class="error-message">
                <span class="error-icon" aria-hidden="true"></span>
                <span>${loginResult}</span>
              </div>
            </c:if>

            <button type="submit" class="signin-btn">Đăng nhập</button>
          </form>
        </div>
      </section>

      <section class="visual-panel" aria-hidden="true">
        <div class="panel-topline">
          <span></span>
          <span></span>
          <span></span>
        </div>

        <div class="visual-content">
          <div class="status-row">
            <span class="status-dot"></span>
            <span>Workspace ready</span>
          </div>

          <div class="progress-visual">
            <div class="progress-ring">
              <span>86</span>
            </div>
            <div class="progress-copy">
              <strong>Executive view</strong>
              <span>Tasks, projects, roles</span>
            </div>
          </div>

          <div class="mini-board">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
          </div>
        </div>
      </section>
    </div>

    <script src="${ctx}/js/common.js"></script>
    <script>
      (function () {
        var passwordInput = document.getElementById('password');
        var toggleBtn = document.getElementById('togglePassword');

        if (!passwordInput || !toggleBtn) {
          return;
        }

        toggleBtn.addEventListener('click', function () {
          var isHidden = passwordInput.type === 'password';
          passwordInput.type = isHidden ? 'text' : 'password';

          toggleBtn.setAttribute('aria-pressed', isHidden ? 'true' : 'false');
          toggleBtn.setAttribute('aria-label', isHidden ? 'Ẩn mật khẩu' : 'Hiện mật khẩu');
        });
      })();
    </script>
  </body>
</html>
