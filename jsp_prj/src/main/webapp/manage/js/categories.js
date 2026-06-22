/**
 * 
 */

const editButtons = document.querySelectorAll(".edit-btn");
editButtons.forEach(function(btn){
    btn.addEventListener("click", function(){
        document.getElementById("editCategoryNo").value =
            this.dataset.no;
        document.getElementById("editCategoryName").value =
            this.dataset.name;
        document.getElementById("editCategoryStatus").value =
            this.dataset.status;
        document.getElementById("editCategoryModal").style.display = "flex";
    });
});

// 수정 모달
const editModal = document.getElementById("editCategoryModal");
const editCloseBtn = document.getElementById("editCloseBtn");
const editCancelBtn = document.getElementById("editCancelBtn");

editCloseBtn.addEventListener("click", function () {
    editModal.style.display = "none";
});
editCancelBtn.addEventListener("click", function () {
    editModal.style.display = "none";
});
window.addEventListener("click", function (e) {
    if (e.target == editModal) {
        editModal.style.display = "none";
    }
});

document.getElementById("editSaveBtn").addEventListener("click", function(){
    let categoryNo = document.getElementById("editCategoryNo").value;
    let categoryName = document.getElementById("editCategoryName").value.trim();
    let categoryStatus = document.getElementById("editCategoryStatus").value;

    if(categoryName == ""){
        alert("카테고리명을 입력해주세요.");
        return;
    }

    // Ajax
    // updateCategory.do

});

window.onload = function () {

    const modal = document.getElementById("categoryModal");
    const addBtn = document.getElementById("addCategoryBtn");
    const closeBtn = document.getElementById("closeModal");
    const cancelBtn = document.getElementById("cancelBtn");
    const saveBtn = document.getElementById("saveBtn");

    // 추가 버튼
    addBtn.addEventListener("click", function () {
        modal.style.display = "flex";
        document.getElementById("categoryName").value = "";
        document.getElementById("categoryName").focus();
    });

    // X 버튼
    closeBtn.addEventListener("click", function () {
        modal.style.display = "none";
    });

    // 취소 버튼
    cancelBtn.addEventListener("click", function () {
        modal.style.display = "none";
    });

    // 모달 바깥 클릭
    window.addEventListener("click", function (e) {
        if (e.target == modal) {
            modal.style.display = "none";
        }
    });

    // 저장 버튼
    saveBtn.addEventListener("click", function () {
        let categoryName = document.getElementById("categoryName").value.trim();

        if (categoryName == "") {
            alert("카테고리명을 입력해주세요.");
            document.getElementById("categoryName").focus();
            return;
        }

        // 여기서 Ajax 또는 form submit으로 서버에 저장
        alert("카테고리가 저장되었습니다.");
        modal.style.display = "none";
    });
};