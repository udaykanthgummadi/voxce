
function CheckAlpha(event,FieldId,errorid){
	   var a=$.trim($('#'+FieldId).val());
	   var filter = /^[A-Za-z]+$/;
	    if(!filter.test(a)){
	    	$('#'+errorid).show().html("Please Type Alphabets Only!");
			Prevent_Event(event);
		    return false;
	    }
	    else{
	    	$('#'+errorid).hide();
	    	return true;
	    }
}

function CheckAlphaNumeric(event,FieldId,errorid){
	   var a=$.trim($('#'+FieldId).val());
	   var filter = /^[0-9A-Za-z]+$/;
	    if(!filter.test(a)){
	    	$('#'+errorid).show().html("Please Type Digits and Alphabets Only!");
			Prevent_Event(event);
		    return false;
	    }
	    else{
	    	$('#'+errorid).hide();
	    	return true;
	    }
}

function CheckAlphaNumericWithoutSpace(event,FieldId,errorid){
	   var a=$.trim($('#'+FieldId).val());
	   var filter = /^[0-9A-Za-z\s]+$/;
	    if(!filter.test(a)){
	    	$('#'+errorid).show().html("Please Type Digits and Alphabets Only (Spaces are Allowed)!");
			Prevent_Event(event);
		    return false;
	    }
	    else{
	    	$('#'+errorid).hide();
	    	return true;
	    }
}

function validateEmail(event,FieldId,errorid){
	
	   var a=$.trim($('#'+FieldId).val());
	   var filter = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9]+[a-zA-Z0-9.-]+[a-zA-Z0-9]+.[a-z]{1,4}$/;
	   if(!filter.test(a)){
	    	$('#'+errorid).show().html("Invalid Email Address !");
	    	Prevent_Event(event);
		    return false;
	    }
	    else{
	    	$('#'+errorid).hide();
	    	return true;
	    }
}

function countStartZero(value){
	
	var i=0;
	var count=0;
	
	while(value.charAt(i)=='0'){
		count++;
		i++;
		if(i>=value.length)
			break;
		
		}
	return count;
}
function Validate_Numeric(event,FieldId,errorid)
{
	
	if($('#'+FieldId).val() != "") {
		
		
	    var value = $('#'+FieldId).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	    if(countStartZero(value)>0){
	    	 $('#'+errorid).show().html("Field must be numeric");
		        Prevent_Event(event);
		        return false;
	    }
	    var intRegex = /^\d+$/;
	    if(!intRegex.test(value)) {
	        $('#'+errorid).show().html("Field must be numeric");
	        Prevent_Event(event);
	        return false;
	    }
	} else {
		$('#'+errorid).show().html("Field is blank");
		Prevent_Event(event);
	    return false;
	}
	$('#'+errorid).hide();
	return true;
}



function Validate_Numeric_range(event,FieldId,errorid,min,max)
{
	if($('#'+FieldId).val() != "") {
	    var value = $('#'+FieldId).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	    var intRegex = /^\d+$/;
	    if(!intRegex.test(value)) {
	        $('#'+errorid).show().html("Field must be numeric");
	        Prevent_Event(event);
	        return false;
	    }
	    
	} else {
		$('#'+errorid).show().html("Field is blank");
		Prevent_Event(event);
	    return false;
	}
	var val=$('#'+FieldId).val();
	
	if(val.length>min && val.length<max){
		
		$('#'+errorid).hide().html("");
	}else{
		$('#'+errorid).show().html("Field length must be less than 10! ");        
        Prevent_Event(event);
        return false;
	}
	$('#'+errorid).hide();
	return true;
}
function Check_isempty(event,FieldId,errorid)
{
	var a=$.trim($('#'+FieldId).val());
	if(a=="" || a== null)
	{
		$('#'+errorid).show().html("Field is blank");
		
		Prevent_Event(event);
		return false;
	}
	$('#'+errorid).hide();
	return true;
}

function Prevent_Event(event)
{
	if(event.preventDefault)
		event.preventDefault();
	else
		event.returnValue = false;

}
function Optional_Numeric(event,FieldId,errorid)
{
	 if($('#'+FieldId).val() != "") {
	     var value = $('#'+FieldId).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	     if(countStartZero(value)>1){
	    	 $('#'+errorid).show().html("Field must be numeric");
		        Prevent_Event(event);
		        return false;
	    }
	     var intRegex = /^\d+$/;
	     if(!intRegex.test(value)) {
	         $('#'+errorid).show().html("Field must be numeric");       
	         Prevent_Event(event);
	         return false;
	     }
	 } 
	 $('#'+errorid).hide();
	 return true;
}


function Optional_Numeric_Range(event,FieldId,errorid,min,max)
{
 if($('#'+FieldId).val() != "") {
     var value = $('#'+FieldId).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '');
     var intRegex = /^\d+$/;
     if(!intRegex.test(value)) {
         $('#'+errorid).show().html("Field must be numeric");        
         Prevent_Event(event);
         return false;
     }
  
     if(value<min || value>max)
      {
        $('#'+errorid).show().html("Field value out of range");        
          Prevent_Event(event);
          return false;
      }
 } 
 $('#'+errorid).hide();
 return true;
}

function Character_Range(event,FieldId,errorid,range){
 
 if($('#'+FieldId).val() != "") {
  val = $('#'+FieldId).val().replace(/[^a-zA-z0-9]/g,'');
  var value = val.length;
   if(value > range)
      {
        $('#'+errorid).show().html("Field value out of range");        
          Prevent_Event(event);
          return false;
      }
     }
 else{
  $('#'+errorid).show().html("Field is blank");
  Prevent_Event(event);
     return false;
 }  
 $('#'+errorid).hide();
 return true;
}

function Alpha_Numeric_Range(event,FieldId,errorid,min,max)
{
 var value = $('#'+FieldId).val().length;
 if($('#'+FieldId).val() != "") {
   if(value<min || value>max)
      {
        $('#'+errorid).show().html("Field value out of range");        
          Prevent_Event(event);
          return false;
      }
     }
 else{
  $('#'+errorid).show().html("Field is blank");
  Prevent_Event(event);
     return false;
 }  
 $('#'+errorid).hide();
 return true;
}


function Validate_Decimal(event,FieldId,errorid)
{

 if($('#'+FieldId).val() != "") {
     var value = $('#'+FieldId).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '').replace(".",'');
     if(countStartZero(value)>1){
    	 $('#'+errorid).show().html("Field must be numeric");
	        Prevent_Event(event);
	        return false;
    }
     var intRegex = /^\d+$/;
     if(!intRegex.test(value)) {
         $('#'+errorid).show().html("Field must be numeric");        
         Prevent_Event(event);
         return false;
     }
 } else {
  $('#'+errorid).show().html("Field is blank");
  Prevent_Event(event);
     return false;
 }
 $('#'+errorid).hide();
 return true;
}

function Validate_Decimal_Within_Range(event,FieldId,errorid)
{

 if($('#'+FieldId).val() != "") {
     var value = $('#'+FieldId).val().replace(/^\s\s*/, '').replace(/\s\s*$/, '').replace(".",'');
     var intRegex = /^\d+$/;
     if(!intRegex.test(value)) {
         $('#'+errorid).show().html("Field must be numeric");        
         Prevent_Event(event);
         return false;
     }
     else{
    		var val = parseFloat($('#'+FieldId).val());
    		if(val>2147483647)
    		{
    			 $('#'+errorid).show().html("Amount should be less than 9999999");        
    	         Prevent_Event(event);
    	         return false;
    		}
     }
 } else {
  $('#'+errorid).show().html("Field is blank");
  Prevent_Event(event);
     return false;
 }
 $('#'+errorid).hide();
 return true;
}

