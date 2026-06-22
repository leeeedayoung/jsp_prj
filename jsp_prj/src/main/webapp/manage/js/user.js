/**
 * 
 */
const rows = document.querySelectorAll(".user-row");
let selectedRow = null;
rows.forEach(row => {
    row.addEventListener("click", function(){
        const detail = document.getElementById("userDetail");

        // 같은 행 다시 클릭
        if(selectedRow === this){
            detail.style.display = "none";
            this.classList.remove("selected");
            selectedRow = null;
            return;
        }

        rows.forEach(r => r.classList.remove("selected"));
        this.classList.add("selected");
        selectedRow = this;
        detail.style.display = "block";
        document.getElementById("detailName").textContent =
            this.dataset.name;
        document.getElementById("detailEmail").textContent =
            this.dataset.email;
        document.getElementById("detailPhone").textContent =
            this.dataset.phone;
        document.getElementById("detailDate").textContent =
            this.dataset.date;
        document.getElementById("detailGrade").textContent =
            this.dataset.grade;
    });
});