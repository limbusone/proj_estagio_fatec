// Aplica mascara
jQuery(document).ready(function($) {
     $("#date").mask("99/99/9999");
     $("#interveniente_telefone").mask("(999) 9999-9999");
     $("#concedente_telefone").mask("(999) 9999-9999");
     $("#concedente_cnpj").mask("99999999999999");
     $("#interveniente_cnpj").mask("99999999999999");
     $("#tin").mask("99-9999999");
     $("#ssn").mask("999-99-9999");
});
