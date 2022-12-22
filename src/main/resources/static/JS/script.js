document.querySelector("#show-login").addEventListener("click", function(){
	document.querySelector(".popup").classList.add("active");
});

document.querySelector(".popup .close-btn").addEventListener("click", function(){
	document.querySelector(".popup").classList.remove("active");
});

/*const yearSelect = document.getElementById("year");
function populateYears(){
	let year = new Date().getFullYear();
	for(let i=0; i<101; i++){
		const option = document.createElement('option');
		option.textContent = year-1;
		yearSelect.appendChild(option);
	}
}*/