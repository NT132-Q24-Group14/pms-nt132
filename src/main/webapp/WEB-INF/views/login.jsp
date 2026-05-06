<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng nhập | PMS</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
  </head>
  <body class="login-page">
    <div class="login-shell">
      <section class="auth-panel">
        <div class="auth-card">
          <a class="brand-mark" href="${ctx}/login" aria-label="PMS">
            <span>P</span>
            <strong>PMS Workspace</strong>
          </a>

          <div class="auth-head">
            <p class="eyebrow">Quản lý dự án nội bộ</p>
            <h1>Đăng nhập</h1>
            <p>Truy cập bảng điều khiển để theo dõi công việc, dự án và nhân sự.</p>
          </div>

          <form action="${ctx}/login" method="post" class="auth-form">
            <div class="field-group">
              <label for="email">Email</label>
              <div class="input-wrap">
                <i class="fa-regular fa-envelope"></i>
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
                <i class="fa-solid fa-lock"></i>
                <input id="password" type="password" name="password" placeholder="Nhập mật khẩu" required />
                <button
                  id="togglePassword"
                  class="toggle-password"
                  type="button"
                  aria-label="Hiện mật khẩu"
                  aria-pressed="false"
                >
                  <i class="fa-regular fa-eye-slash"></i>
                </button>
              </div>
            </div>

            <div class="form-options">
              <label class="remember-wrap">
                <input type="checkbox" name="remember" />
                <span>Nhớ mật khẩu</span>
              </label>
            </div>

            <c:if test="${not empty loginResult}">
              <div class="error-message">
                <i class="fa-solid fa-circle-exclamation"></i>
                <span>${loginResult}</span>
              </div>
            </c:if>

            <button type="submit" class="signin-btn">
              <span>Đăng nhập</span>
              <i class="fa-solid fa-arrow-right"></i>
            </button>
          </form>
        </div>
      </section>

      <aside class="insight-panel" aria-label="Tổng quan hệ thống">
        <div class="insight-top">
          <span class="status-dot"></span>
          <span>Workspace đang hoạt động</span>
        </div>

        <div class="hero-copy">
          <h2>Điều phối công việc trong một màn hình tập trung.</h2>
          <p>Kiểm soát tiến độ, phân quyền và danh sách thành viên với trải nghiệm nhẹ, rõ, dễ thao tác.</p>
        </div>

        <div class="metrics-grid">
          <div class="metric-card">
            <span class="metric-label">Dự án</span>
            <strong>12</strong>
            <small>đang theo dõi</small>
          </div>
          <div class="metric-card accent">
            <span class="metric-label">Công việc</span>
            <strong>84%</strong>
            <small>có tiến độ</small>
          </div>
        </div>

        <div class="activity-board">
          <div class="board-head">
            <span>Luồng hôm nay</span>
            <i class="fa-solid fa-chart-simple"></i>
          </div>
          <div class="activity-row">
            <i class="fa-solid fa-circle-check"></i>
            <div>
              <strong>Thiết kế database</strong>
              <span>Đã hoàn thành</span>
            </div>
          </div>
          <div class="activity-row">
            <i class="fa-solid fa-clock"></i>
            <div>
              <strong>Phân tích hệ thống</strong>
              <span>Đang thực hiện</span>
            </div>
          </div>
          <div class="activity-row">
            <i class="fa-solid fa-layer-group"></i>
            <div>
              <strong>Quản lý thành viên</strong>
              <span>Sẵn sàng cập nhật</span>
            </div>
          </div>
        </div>
      </aside>
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${ctx}/js/common.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
          toggleBtn.innerHTML = !isHidden
            ? '<i class="fa-regular fa-eye-slash"></i>'
            : '<i class="fa-regular fa-eye"></i>';
        });
      })();
    </script>
  </body>
</html>
