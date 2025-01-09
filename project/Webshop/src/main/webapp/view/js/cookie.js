const cookieBanner = document.getElementById('cookie-banner');
const acceptBtn = document.getElementById('accept-cookie-btn');
const rejectBtn = document.getElementById('reject-cookie-btn');

// Hàm kiểm tra xem cookie 'cookieConsent' có tồn tại không
function hasCookieConsent() {
    return document.cookie.split('; ').some(cookie => cookie.startsWith('cookieConsent='));
}

if (!hasCookieConsent()) { // Nếu cookie chưa tồn tại, hiển thị banner
    cookieBanner.classList.add('visible');
}

acceptBtn.onclick = function () {
    // Tạo cookie 'cookieConsent' với giá trị 'true'
    document.cookie = 'cookieConsent=true; path=/;';
    cookieBanner.classList.remove('visible');
    setTimeout(() => {
        window.location.href = window.location.href;
    }, 500);
};

rejectBtn.onclick = function () {
    // Tạo cookie 'cookieConsent' với giá trị 'false'
    document.cookie = 'cookieConsent=false; path=/;';
    cookieBanner.classList.remove('visible');
    setTimeout(() => {
        window.location.href = window.location.href;
    }, 500);
};