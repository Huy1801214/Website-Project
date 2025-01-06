    const cookieBanner = document.getElementById('cookie-banner');
    const acceptBtn = document.getElementById('accept-cookie-btn');
    const rejectBtn = document.getElementById('reject-cookie-btn');
    const cookieConsent = localStorage.getItem('cookieConsent'); // Kiểm tra đã có sự đồng ý chưa

    if (cookieConsent === null) { // nếu người dùng chưa có cookie, sẽ hiện thông báo
        cookieBanner.classList.add('visible');
    }

    acceptBtn.onclick = function () {
        localStorage.setItem('cookieConsent', 'true');
        cookieBanner.classList.remove('visible');
        setTimeout(() => {
            window.location.href = window.location.href;
        }, 500);

    };

    rejectBtn.onclick = function () {
        localStorage.setItem('cookieConsent', 'false');
        cookieBanner.classList.remove('visible');
        setTimeout(() => {
            window.location.href = window.location.href;
        }, 500);
    };
