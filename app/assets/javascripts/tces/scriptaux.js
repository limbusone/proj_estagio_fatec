jQuery(function() 
{
  //habilita/desabilita botao addFields
  function habilitarOpcaoAddFieldsEAddNovosFields(opc)
  {
    if (Number(opc))
    {
      $(".cmdAddFields").show();
      $("#domingoFields").show();
      addNovosFields($(".fields"));
    }
    else
    {
      $(".cmdAddFields").hide();
      $("#domingoFields").hide();
      removeNovosFields();
    }    
  }
  function addNovosFields(fieldsDivJQueryObject)
  {
    fieldsDivJQueryObject.each(function(i) 
    {
      var fieldsDiv = this;
      var newFieldsDiv = $(fieldsDiv).find("div:last");
      $(fieldsDiv).find("label:eq(0)").clone().appendTo(newFieldsDiv);
      newFieldsDiv.append("<br />");
      $(fieldsDiv).find("select:eq(0)").clone().appendTo(newFieldsDiv);
      newFieldsDiv.append(" : ");
      $(fieldsDiv).find("select:eq(1)").clone().appendTo(newFieldsDiv);
      $(fieldsDiv).find("label:eq(1)").clone().appendTo(newFieldsDiv);
      newFieldsDiv.append("<br />");
      $(fieldsDiv).find("select:eq(2)").clone().appendTo(newFieldsDiv);
      newFieldsDiv.append(" : ");
      $(fieldsDiv).find("select:eq(3)").clone().appendTo(newFieldsDiv);
    });
  }
  function removeNovosFields()
  {
    $(".fields .newFields").empty();
  }
  var opc = $("[name='opcao_horario']:checked").val();
  habilitarOpcaoAddFieldsEAddNovosFields(opc);  
  $("[name='opcao_horario']").click(function(event)
  {
    habilitarOpcaoAddFieldsEAddNovosFields(Number($(this).val()));
  });
  //adiciona novos campos caso precise
  $(".cmdAddFields").click(function(event)
  {
    var cDivFields = event.target.parentNode;
    addNovosFields($(cDivFields));
    //$(cDivFields).find("select:last").clone().appendTo(cDivFields);    
    //var label_select_inicio = event.target.parentNode.getElementsByTagName("label")[0].cloneNode(true);
    //var select_inicio = event.target.parentNode.getElementsByTagName("select")[0].cloneNode(true);
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
  });

})

