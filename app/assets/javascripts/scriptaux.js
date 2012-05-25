jQuery(function() 
{
  $(".cmdAddFields").click(function(event)
  {
    /*
    var newHorarioInicioLabel     = document.createElement("label");
    var newHorarioInicioTextField = document.createElement("input");
    
    var newHorarioFimLabel        = document.createElement("label");
    var newHorarioFimTextField    = document.createElement("input");
    
    newHorarioInicioLabel.setAttribute("for", "inicio_");
    newHorarioInicioTextField.setAttribute("id", "inicio_");
    newHorarioInicioTextField.setAttribute("name", "inicio[]");
    
    newHorarioFimLabel.setAttribute("for", "final_");
    newHorarioFimTextField.setAttribute("id", "final_");
    newHorarioFimTex
    tField.setAttribute("name", "final[]");
    */
    var cDivFields = event.target.parentNode;
    cDivFields
    $(cDivFields).find("label:eq(0)").clone().appendTo(cDivFields);
    $(cDivFields).find("select:eq(0)").clone().appendTo(cDivFields);
    $(cDivFields).append(" : ");
    $(cDivFields).find("select:eq(1)").clone().appendTo(cDivFields);
    $(cDivFields).find("label:eq(1)").clone().appendTo(cDivFields);
    $(cDivFields).find("select:eq(2)").clone().appendTo(cDivFields);
    $(cDivFields).append(" : ");
    $(cDivFields).find("select:eq(3)").clone().appendTo(cDivFields);
    //$(cDivFields).find("select:last").clone().appendTo(cDivFields);    
    //var label_select_inicio = event.target.parentNode.getElementsByTagName("label")[0].cloneNode(true);
    //var select_inicio = event.target.parentNode.getElementsByTagName("select")[0].cloneNode(true);
  });

})
