#encoding: gbk
require 'erb'
require 'csv'

context = {}

temp_field_set = ERB.new %q{
<fieldset>
    <legend><%= context['set_name']%></legend>
    <table style="text-align: left; width: 100%;" border="0" cellpadding="2" cellspacing="2">
        <tbody>
	    <%for set_content in context['set_contents']%>
	    <%= set_content%>
	    <%end%>
        </tbody>
    </table>
</fieldset>}

temp_tr = ERB.new %q{
	<tr>
	    <td style="vertical-align: top; width: 25%;"><%= context['field_name']%>:
	        <br>
	    </td>
	    <td style="vertical-align: top; width: 75%;">
	        <input style="width: 100%;" class="default-q" id="<%= context['field_id']%>" name="<%= context['field_id']%>" value="<%= context['field_example']%>" tooltiptext="<%= context['field_desc']%>"/>
	    <br>
	    </td>
	</tr>}

fields_file = $*[0]

fields = CSV.parse(File.read(fields_file))

context['set_contents'] = []

context['set_name'] = fields_file.split('/')[-1].split('.')[0]

fields.each do |field|
  field_id = field[0].strip
  field_name = field[1].strip
  field_desc = field[3].strip + ',' + field[4].strip
  field_example = field[5]
  if nil != field_example then
    field_example = field_example.strip
    field_desc = field_desc + '<br>' + field_example
  end
  context['field_id'] = field_id
  context['field_name'] = field_name
  context['field_desc'] = field_desc
  context['field_example'] = field_example
  context['set_contents'] << temp_tr.result
end

puts temp_field_set.result