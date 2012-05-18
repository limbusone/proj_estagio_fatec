jQuery(function() 
{
  $("#addCampos").click(function(event)
  {
    var newHorarioInicioLabel     = document.createElement("label");
    var newHorarioInicioTextField = document.createElement("input");
    
    var newHorarioFimLabel        = document.createElement("label");
    var newHorarioFimTextField    = document.createElement("input");
    
    newHorarioInicioLabel.setAttribute("for", "inicio_");
    newHorarioInicioTextField.setAttribute("id", "inicio_");
    newHorarioInicioTextField.setAttribute("name", "inicio[]");
    
    newHorarioFimLabel.setAttribute("for", "final_");
    newHorarioFimTextField.setAttribute("id", "final_");
    newHorarioFimTextField.setAttribute("name", "final[]");
    
  });
})
