class DateTimePickerInput < SimpleForm::Inputs::Base
  def input
    @builder.text_field(attribute_name, input_html_options)
  end

  def input_html_options
    {class: 'form-datetime form-control', readonly: true}
  end

end
