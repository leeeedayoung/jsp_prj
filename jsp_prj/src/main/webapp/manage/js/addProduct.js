/**
 * 
 */
document.addEventListener("DOMContentLoaded", function () {
    const headers = document.querySelectorAll(".accordion-header");
    headers.forEach(function (header) {
        header.addEventListener("click", function () {
            const content = this.nextElementSibling;
            const arrow = this.querySelector(".arrow");
            if (content.classList.contains("show")) {
                content.classList.remove("show");
                arrow.innerHTML = "&#9662;";   // ▼
            } else {
                content.classList.add("show");
                arrow.innerHTML = "&#9652;";   // ▲
            }
        });
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const productName = document.getElementById("productName");
    const productDesc = document.getElementById("productDesc");
    const nameCount = document.getElementById("nameCount");
    const descCount = document.getElementById("descCount");
    if(productName){
        productName.addEventListener("input", function () {
            nameCount.textContent = this.value.length;
        });
    }
    if(productDesc){
        productDesc.addEventListener("input", function () {
            descCount.textContent = this.value.length;
        });
    }
});