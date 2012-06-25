jQuery(function() 
{
  /****************************
  
  
  **********_Funcoes_**********
  
  
  *****************************/  
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
      var newFieldsDiv = $(fieldsDiv).find(".newFields");
      var nFDiv = document.createElement("div");
      $(nFDiv).addClass("f");
      $(nFDiv).append("<br />");
      $(fieldsDiv).find("label:eq(0)").clone().appendTo(nFDiv);
      $(nFDiv).append(" ");
      $(fieldsDiv).find("select:eq(0)").clone().appendTo(nFDiv).on("change", function(event)
      {
        $("#carga_horaria").val(calcularCargaHoraria);
      });
      $(nFDiv).append(" : ");
      $(fieldsDiv).find("select:eq(1)").clone().appendTo(nFDiv).on("change", function(event)
      {
        $("#carga_horaria").val(calcularCargaHoraria);
      });
      $(nFDiv).append(" ");
      $(fieldsDiv).find("label:eq(1)").clone().appendTo(nFDiv);
      $(nFDiv).append(" ");
      $(fieldsDiv).find("select:eq(2)").clone().appendTo(nFDiv).on("change", function(event)
      {
        $("#carga_horaria").val(calcularCargaHoraria);
      });
      $(nFDiv).append(" : ");
      $(fieldsDiv).find("select:eq(3)").clone().appendTo(nFDiv).on("change", function(event)
      {
        $("#carga_horaria").val(calcularCargaHoraria);
      });
      newFieldsDiv.append(nFDiv);
    });
  }
  
  function addNovosFieldsAtividades(fieldsDivJQueryObject)
  {
    fieldsDivJQueryObject.each(function(i) 
    {
      var fieldsDiv = this;
      var newFieldsDiv = $(fieldsDiv).find(".newFields");
      var nFDiv = document.createElement("div");
      $(nFDiv).addClass("f");
      //$(nFDiv).append("<br />");
      $(nFDiv).append("<br />");
      $(fieldsDiv).find("select:eq(0)").clone().appendTo(nFDiv);
      newFieldsDiv.append(nFDiv);
    });
  }  
  
  function removeTodosNovosFields(fieldsDivJQueryObject)
  {
    var newFieldsDiv = fieldsDivJQueryObject.find(".newFields");
    newFieldsDiv.empty();
  }
  function removeLastField(fieldsDivJQueryObject)
  {
    var newFieldsDiv = fieldsDivJQueryObject.find(".newFields");
    newFieldsDiv.find("div:last").empty();
    newFieldsDiv.find("div:last").remove();
  }
  function calcularCargaHoraria()
  {
    var hora_em_milisegundos = 1000*60*60;
    var vTempo_horas_total = 0;
    $(".fields:gt(0)").each(function(i) //a partir do div de segunda-feira 
    {
      var divFields = this;
      var primeiraHiddenTag = $(divFields).find("[type='hidden']:first");
      if (Number(primeiraHiddenTag.val()))
      {
        $(divFields).find(".f").each(function(j)
        {
          var divF = this;
          var hInicio = new Date();
          var hFinal  = new Date();
          hInicio.setHours($(divF).find("select:eq(0)").val()); // horas inicio
          hInicio.setMinutes($(divF).find("select:eq(1)").val()); // minutos inicio
          hInicio.setSeconds(0);
          hFinal.setHours($(divF).find("select:eq(2)").val()); // horas final
          hFinal.setMinutes($(divF).find("select:eq(3)").val()); // minutos final
          hFinal.setSeconds(0);      
          var vTempo_milisegundos = hFinal.getTime() - hInicio.getTime();
          var vTempo_horas = Math.floor(vTempo_milisegundos / hora_em_milisegundos);
          vTempo_horas_total += vTempo_horas;
        });
      }
    });
    return vTempo_horas_total;  
  }
  
  /****************************
  
  
  **********_Eventos_**********
  
  
  *****************************/
  $(".cmdRemoveField").click(function(event)
  {
    var cDivFields = this.parentNode.parentNode;
    removeLastField($(cDivFields));
    $("#carga_horaria").val(calcularCargaHoraria);
  });
  $(".cmdRemoveNovosFields").click(function(event)
  {
    var cDivFields = this.parentNode.parentNode;
    removeTodosNovosFields($(cDivFields));
    $("#carga_horaria").val(calcularCargaHoraria);
  });
  $(".toggling").click(function(event)
  {
    var cDivFieldsJQuery = $(this).next().next().next();
    var primeiraHiddenTag = cDivFieldsJQuery.find("[type='hidden']:first");
    if (Number(primeiraHiddenTag.val()))
      primeiraHiddenTag.val("0");
    else
      primeiraHiddenTag.val("1");
    cDivFieldsJQuery.slideToggle("normal");
    if ($(this).find(":first").attr("classorigem") == "icon-chevron-up")
      $(this).find(":first").toggleClass("icon-chevron-down");
    else
    {
      if ($(this).find(":first").hasClass("icon-chevron-down"))
      {
        $(this).find(":first").addClass("icon-chevron-up");
        $(this).find(":first").removeClass("icon-chevron-down");
      }
      else
      {
        $(this).find(":first").addClass("icon-chevron-down");
        $(this).find(":first").removeClass("icon-chevron-up");
      }
    }
    $("#carga_horaria").val(calcularCargaHoraria);
  });

  $(".cmdAddFields").click(function(event)
  {
    var cDivFields = this.parentNode.parentNode;
    addNovosFields($(cDivFields));
    $("#carga_horaria").val(calcularCargaHoraria);
  });
  $(".cmdCalcularCargaHoraria").click(function(event)
  {
    $("#carga_horaria").val(calcularCargaHoraria);
  });
  $("select:gt(3)").change(function(event)
  {
    $("#carga_horaria").val(calcularCargaHoraria);
  });
  $(".cmdConclusao").click(function(event)
  {
    $("#hidConclusao").val(1);
  });
  $(".cmdAddFieldsAtividade").click(function(event)
  {
    var cDivFields = this.parentNode.parentNode;
    addNovosFieldsAtividades($(cDivFields));
  });
  $("#chkRes").change(function(event)
  {
    if (!($(this).attr("checked")))
      $("#divDataRes").hide();
    else
      $("#divDataRes").show();
  });
})

