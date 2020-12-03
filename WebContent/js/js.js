function insert(){
	if(vaildCheck()){
		alert("회원 등록되었습니다.")
		document.getElementById("join").submit();
	}
}

function update(){
	if(vaildCheck()){
		alert("수정완료 되었습니다.");
		document.getElementById("update").submit();
	}
}

function vaildCheck(){
	if(document.getElementById("custName").value==0){
		alert("회원성명을 입력해주세요");
		document.getElementById("custName").focus();
		return false;
	}
	if(document.getElementById("phone").value==0){
		alert("전화번호를 입력해주세요");
		document.getElementById("phone").focus();
		return false;
	}
	if(document.getElementById("address").value==0){
		alert("회원주소를 입력해주세요");
		document.getElementById("address").focus();
		return false;
	}
	if(document.getElementById("grade").value==0){
		alert("고객등급을 입력해주세요");
		document.getElementById("grade").focus();
		return false;
	}
	if(document.getElementById("city").value==0){
		alert("도시코드을 입력해주세요");
		document.getElementById("city").focus();
		return false;
	}
	return true;
}