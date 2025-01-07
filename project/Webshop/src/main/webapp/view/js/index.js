document.addEventListener('DOMContentLoaded', function() {
    const slidesContainer = document.querySelector('.slides');
    const slides = document.querySelectorAll('.slide');
    const prevButton = document.querySelector('.prev-button');
    const nextButton = document.querySelector('.next-button');

    let currentIndex = 0;
    const slideCount = slides.length;
    let startX;
    let isDragging = false;

    function goToSlide(index) {
        if (index < 0 || index >= slideCount) {
            return;
        }
        slidesContainer.style.transform = `translateX(-${index * 100}%)`;
        currentIndex = index;
    }


    function nextSlide() {
        if (currentIndex === slideCount - 1) {
            currentIndex = 0;
            slidesContainer.style.transform = `translateX(0%)`;// Quay về slide đầu tiên
        }else{
            goToSlide(currentIndex + 1)
        }
    }

    function prevSlide() {
        if (currentIndex === 0) {
            currentIndex = slideCount - 1;
            slidesContainer.style.transform = `translateX(-${currentIndex * 100}%)`;
        }else{
            goToSlide(currentIndex -1)
        }

    }

    // Xử lý sự kiện bắt đầu chạm (touchstart)
    slidesContainer.addEventListener('touchstart', (e) => {
        startX = e.touches[0].clientX;
        isDragging = true;
    });

    // Xử lý sự kiện di chuyển chạm (touchmove)
    slidesContainer.addEventListener('touchmove', (e) => {
        if(!isDragging) return;
        let currentX = e.touches[0].clientX;
        let diffX = startX - currentX;
        if(Math.abs(diffX) > 50)
        {
            if(diffX > 0)
                nextSlide()
            else prevSlide()
            isDragging = false;
        }
    });
    // Xử lý sự kiện kết thúc chạm (touchend)
    slidesContainer.addEventListener('touchend', ()=>{
        isDragging = false;
    })

    nextButton.addEventListener('click', nextSlide);
    prevButton.addEventListener('click', prevSlide);
    setInterval(nextSlide, 8000);

});