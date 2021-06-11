// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= #require turbolinks
//= require_tree .

$(function() {
    $("#staff_index").children().hide(); //hide all staff checkbox.
    $("#location_index").hide(); //hide all location radio checkbox.
    $("#eventform").children().hide(); //hide event checkbox.
    $("[name ='staff[organization_id]']").parent().hide(); //hide organization_id field
    $("[name ='event[organization_id]']").parent().hide(); //hide organization_id field
    $("[name ='event[location_id]']").parent().hide(); //hide organization_id field
        $("[name ='events_staff[staff_qr_code]']").parent().hide(); //hide staff qr code
    $('#newstaffbutton').hide(); //hide the new staff button if an organization is not selected
    $("#new_event input[name='commit']").hide(); //hide organization_id field
});

function atLeastOneCheckbox(inputName,elementToShow){ //enter the input name of the checkbox group and the id of the element you want to show
        //Check if at least one checkbox from staff is checked
    var atLeastOneIsChecked = false;
    $('input:checkbox[name ="'+inputName+'"]').each(function () {
        if ($(this).is(':checked')) {
          atLeastOneIsChecked = true;
          // Stop .each from processing any more items
          return false;
        }
    });

    if (atLeastOneIsChecked == true){
        $(elementToShow).show(); //element to show
    } else {
        $(elementToShow).hide(); //hide element
    }
}


//for checking if any input is empty
function isEveryInputEmpty(form_name) {
    var someEmptyFields = false;
    $(form_name+' input').each(function() {
        if ($(this).val()==''){
            someEmptyFields = true; //if a field is empty, indicate that at least one field is empty
        }
    });

    if ($(form_name+' textarea').val()==''){
        someEmptyFields = true; //if a textarea is empty
    }

    //if some there are some empty fields, alert and return false
    if (someEmptyFields==true){
        return false;
    } else {
        return true;
    }
}


function showStaff() {
    $('#staff_index input:checkbox[name ="staff_name"]').prop('checked', false); //uncheck all checkboxes
    var organization_id = $("input:radio[name ='org_id']:checked").val(); //get value of organization id from the organization selected
    $("#staff_index div").not(".org"+organization_id).hide(); //hide all children not relating to the organization by organization_id
    $('.org'+organization_id).show(); //show all children relating to the organization by organization_id
    $("[name='staff[organization_id]']").val(organization_id); //set organization_id of staff form
    $("[name='event[organization_id]']").val(organization_id); //set organization_id of event form
    $('#newstaffbutton').show(); //show the staff button
}

//Show location when a user selects a staff
function showLocation() {
    atLeastOneCheckbox("staff_name","#location_index"); //check if at least one checkbox is checked
    var organization_id = $("input:radio[name ='org_id']:checked").val(); //get organization_id

    if (!$(this).parents('.org'+organization_id)) { //check if the selected staff's parent element has class of the organization selected
        alert('This staff is not part of the organization. Please refresh the page or use javascript.');
        $('input:checkbox[name ="staff_name"]').prop('checked', false);
    }
}

//Show event form when a user selects a location
function showEventForm() {
    $("#eventform").children().show();
    var location_id = $("input:radio[name ='loc_id']:checked").val(); //get value of location id from the location selected
    $("[name ='event[location_id]']").val(location_id); //set location_id of event form
}

function finishedEvent(){
    if (isEveryInputEmpty("#new_event")==false){
        alert("Please fill in the fields");
    } else {
        //alert($("#new_event input[name='commit']").val()); //For testing
        $( "#new_event" ).submit();
    }
}