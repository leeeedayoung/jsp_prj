document.addEventListener("DOMContentLoaded", function () {
    const resetBtn = document.querySelector(".btn-reset");

    resetBtn.addEventListener("click", function () {
        // 검색어 초기화
        document.getElementById("keyword").value = "";
        // 판매상태 -> 전체
        document.querySelector(
            "input[name='status'][value='all']"
        ).checked = true;
        // 카테고리 -> 전체
        document.getElementById("category").selectedIndex = 0;
        // 날짜 초기화
        document.getElementById("startDate").value = "";
        document.getElementById("endDate").value = "";
        // 기간 버튼 active 제거
        document.querySelectorAll(".date-btns button")
            .forEach(btn => btn.classList.remove("active"));
        // 기본값(3개월) 선택
        document.querySelectorAll(".date-btns button")[3]
            .classList.add("active");
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const dateButtons = document.querySelectorAll(".date-btns button");

    dateButtons.forEach(function(btn) {
        btn.addEventListener("click", function() {
            // 기존 active 제거
            dateButtons.forEach(function(item) {
                item.classList.remove("active");
            });
            // 현재 버튼 active 추가
            this.classList.add("active");
        });
    });
});

const pageSize = document.getElementById("pageSize");
pageSize.addEventListener("change", function() {
    let size = this.value;
    console.log(
        "페이지당 표시 개수 : " + size
    );
});

const searchBtn = document.querySelector(".btn-search");
searchBtn.addEventListener("click", function(){
    let keyword =
        document.getElementById("keyword").value;
    let status =
        document.querySelector(
            "input[name='status']:checked"
        ).value;
    let category =
        document.getElementById("category").value;
    location.href =
        "adminProducts.jsp"
        + "?keyword=" + keyword
        + "&status=" + status
        + "&category=" + category;
});

const copyButtons = document.querySelectorAll(".copy-btn");

copyButtons.forEach(function(btn){
    btn.addEventListener("click", function(){
        let productNo = 
            this.dataset.productNo;
        let result = confirm(
            "해당 상품을 복사하시겠습니까?"
        );
        if(result){
            location.href =
            "productCopy.do?productNo="
            + productNo;
        }
    });
});

const checkAll = document.getElementById("checkAll");
const productChecks = document.querySelectorAll(".productCheck");
checkAll.addEventListener("click", function(){
    productChecks.forEach(function(check){
        check.checked = checkAll.checked;
    });
});

productChecks.forEach(function(check){
    check.addEventListener("click", function(){
        let allChecked = document.querySelectorAll(
            ".productCheck:checked"
        ).length === productChecks.length;

        checkAll.checked = allChecked;
    });
});

const deleteBtn = document.getElementById("deleteBtn");
if(deleteBtn){
    deleteBtn.addEventListener("click", function(){

        const checkedProducts =
        document.querySelectorAll(".productCheck:checked");

        if(checkedProducts.length === 0){
            alert("삭제할 상품을 선택해주세요.");
            return;
        }

        let productNos = [];

        checkedProducts.forEach(function(item){
            productNos.push(item.value);
        });

        let result = confirm(
            "선택한 상품을 삭제하시겠습니까?"
        );

        if(result){
            console.log(productNos);
        }
    });
}
