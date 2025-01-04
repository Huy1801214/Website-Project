document.addEventListener('DOMContentLoaded', function () {
    const provinceDropdown = document.getElementById('province');
    const districtDropdown = document.getElementById('district');
    const wardDropdown = document.getElementById('ward');
    const shippingSection = document.getElementById('shipping-section');
    const paymentSection = document.getElementById('payment-section');
    const breadcrumbShipping = document.getElementById('breadcrumb-shipping');
    const breadcrumbPayment = document.getElementById('breadcrumb-payment');
    const nextToPaymentBtn = document.querySelector('.cart-next-group .next-button')


    async function fetchAndPopulateDropdown(url, dropdown, id, name) {
        try {
            console.log("API URL:", url); // Log URL gọi API
            const response = await fetch(url);
            if (!response.ok) {
                console.error("HTTP Error:", response.status); // Log lỗi
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            console.log("Data:", data); // Log dữ liệu trả về
            if (!data || data.length === 0) {
                console.log("No data found for this API call.")
                dropdown.innerHTML = '<option value="" disabled selected>Chọn</option>'; // Reset select nếu không có data
                return;
            }
            dropdown.innerHTML = '<option value="" disabled selected>Chọn</option>';
            data.forEach(item => {
                const option = document.createElement('option');
                option.value = item[id];
                option.text = item[name];
                dropdown.appendChild(option);
            });
        } catch (error) {
            console.error('Failed to fetch and populate', error);
        }
    }

    fetchAndPopulateDropdown('https://provinces.open-api.vn/api/?depth=1', provinceDropdown, 'code', 'name');

    provinceDropdown.addEventListener('change', function () {
        const provinceCode = this.value;
        districtDropdown.innerHTML = '<option value="" disabled selected>Chọn quận / huyện</option>';
        wardDropdown.innerHTML = '<option value="" disabled selected>Chọn phường / xã</option>';
        if (provinceCode) {
            fetchAndPopulateDropdown(`https://provinces.open-api.vn/api/p/${provinceCode}?depth=2`, districtDropdown, 'code', 'name')
        }
    });

    districtDropdown.addEventListener('change', function () {
        const districtCode = this.value;
        wardDropdown.innerHTML = '<option value="" disabled selected>Chọn phường / xã</option>';
        if (districtCode) {
            fetchAndPopulateDropdown(`https://provinces.open-api.vn/api/d/${districtCode}?depth=2`, wardDropdown, 'code', 'name');
        }
    })

    if (nextToPaymentBtn) {
        nextToPaymentBtn.addEventListener('click', function (event) {
            event.preventDefault()
            shippingSection.style.display = 'none';
            paymentSection.style.display = 'block';
            if (breadcrumbShipping) {
                breadcrumbShipping.classList.remove('active')
            }
            if (breadcrumbPayment) {
                breadcrumbPayment.classList.add('active');
            }
        });
    }
});