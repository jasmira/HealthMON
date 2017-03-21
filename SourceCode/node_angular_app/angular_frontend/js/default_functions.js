var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
  }
}

$(document).ready(function() {
  window.onload = load();

/*  $('#west').click(function(e){
    var isClassExists = $(".myPanel1").hasClass("show");
    if(isClassExists){
        $(".myPanel1").removeClass("show");
    }
    else{
        $(".myPanel1").addClass("show");
    }
    var isSubClassExists = $(".myPanel2").hasClass("show");
    if(isSubClassExists){
        $(".myPanel2").removeClass("show");
    }
    else{
        $(".myPanel2").addClass("show");
    }
  });

  $('#west_subzone3').click(function(e){
    var isClassExists = $(".myPanel2").hasClass("show");
    if(isClassExists){
        $(".myPanel2").removeClass("show");
    }
    else{
        $(".myPanel2").addClass("show");
    }
  });*/

});

/*$('#west_Checkbox').change(function() {
    //alert("hi youre in method");
    $(this).siblings('.myPanel1').find(".child").prop("checked", true);
});*/


function load() {
    loadJSON("/static/js/geography.json", function(text){
    var geographydata = JSON.parse(text);

    /*addItem($('#root'), geographydata);
    $(':checkbox').change(function () {
        $(this).closest('li').children('ul').slideToggle();
        $(this).closest('li').find(':checkbox').prop("checked", true);
    });
    $('label').click(function(){
        $(this).closest('li').find(':checkbox').trigger('click');
    });*/

        // North Zone Label
    /*var northLabel = document.getElementById("north");
    northLabel.innerHTML = '<input type="checkbox" disabled>'+geographydata[0].region;

        // South Zone Label
    var southLabel = document.getElementById("south");
    southLabel.innerHTML = '<input type="checkbox" disabled>'+geographydata[1].region;

        // West Zone Label
    var westLabel = document.getElementById("west");
  //  westLabel.innerHTML = '<span id="sub_level_menu_name">'+geographydata[2].region+'</span>';
    westLabel.innerHTML = '<input type="checkbox" class="accordion">' +geographydata[2].region;

        // West Sub Zone 1 Label
    var westSubZone1Label = document.getElementById("west_subzone1");
    westSubZone1Label.innerHTML = '<span id="sub_level_menu_name"><input class="child" type="checkbox">'+geographydata[2].states.state[0].name+'</span>';

        // West Sub Zone 2 Label
    var westSubZone2Label = document.getElementById("west_subzone2");
    westSubZone2Label.innerHTML = '<span id="sub_level_menu_name"><input class="child" type="checkbox">'+geographydata[2].states.state[1].name+'</span>';

        // West Sub Zone 3 Label
    var westSubZone3Label = document.getElementById("west_subzone3");
    //westSubZone3Label.innerHTML = '<span class="check" id="sub_level_menu_name2">'+geographydata[2].states.state[2].name+'</span>';
    westSubZone3Label.innerHTML = '<span id="sub_level_menu_name" style="margin-left: 30px;"><input class="child" type="checkbox" class="accordion">'+geographydata[2].states.state[2].name+'</span>';

        // West Sub Zone 3.1 Label
    var westSubZone3_1Label = document.getElementById("west_subzone3_1");
    westSubZone3_1Label.innerHTML = '<input class="child" type="checkbox">'+geographydata[2].states.state[2].cities[0].city;

        // West Sub Zone 3.2 Label
    var westSubZone3_2Label = document.getElementById("west_subzone3_2");
    westSubZone3_2Label.innerHTML = '<input class="child" type="checkbox">'+geographydata[2].states.state[2].cities[1].city;

        // West Sub Zone 3.3 Label
    var westSubZone3_3Label = document.getElementById("west_subzone3_3");
    westSubZone3_3Label.innerHTML = '<input class="child" type="checkbox">'+geographydata[2].states.state[2].cities[2].city;

        // East Zone Label
    var eastLabel = document.getElementById("east");
    eastLabel.innerHTML = '<input type="checkbox" disabled>'+geographydata[3].region;*/

  });
}

function loadJSON (file, callback) {
    var rawFile = new XMLHttpRequest();
    rawFile.overrideMimeType("application/json");
    rawFile.open("GET", file, true);
    rawFile.onreadystatechange = function() {
        if (rawFile.readyState === 4 && rawFile.status == "200") {
            callback(rawFile.responseText);
        }
    }
    rawFile.send(null);
}

/*function addItem(parentUL, branch) {
    for (var key in branch.children) {
        var item = branch.children[key];
        $item = $('<li>', {
            id: "item" + item.id
        });
        $item.append($('<input>', {
            type: "checkbox",
            id: "item" + item.id,
            name: "item" + item.id
        }));
        $item.append($('<label>', {
            for: "item" + item.id,
            text: item.title
        }));
        parentUL.append($item);
        if (item.children) {
            var $ul = $('<ul>', {
                style: 'display: none'
            }).appendTo($item);
            $item.append();
            addItem($ul, item);
        }
    }
}*/
