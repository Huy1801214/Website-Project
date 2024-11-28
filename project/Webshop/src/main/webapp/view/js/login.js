function toggleForms() {
    const loginForm = document.getElementById('login-form');
    const recoveryForm = document.getElementById('recovery-form');
    const formTitle = document.getElementById('form-title');

    if (loginForm.style.display === 'none') {
        loginForm.style.display = 'block';
        recoveryForm.style.display = 'none';
        formTitle.innerText = 'Đăng Nhập'; // Đặt lại tiêu đề
    } else {
        loginForm.style.display = 'none';
        recoveryForm.style.display = 'block';
        formTitle.innerText = 'Phục hồi mật khẩu'; // Đặt tiêu đề cho form phục hồi
    }
}
document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('login-form');
    const recoveryForm = document.getElementById('recovery-form');

    loginForm.style.display = 'block';
    recoveryForm.style.display = 'none';
});