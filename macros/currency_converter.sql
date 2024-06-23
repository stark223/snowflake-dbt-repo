{% macro currency_converter(currency, value) %}
    {% if currency == "Rupees" %} {{ value }}
    {% elif currency == "YEN" %} {{ value / 80 }}
    {% elif currency == "DOLLARS" %} {{ value / 62 }}
    {% elif currency == "PAR" %} {{ value / 20 }}
    {% endif %}
{% endmacro %}


{% macro sales_values_in_rupees(currency, value) %}
    {% if currency == "RUPEES" %} {{ value }}
    {% elif currency == "YEN" %} {{ value / 80 }}
    {% elif currency == "DOLLARS" %} {{ value / 62 }}
    {% elif currency == "PAR" %} {{ value / 20 }}
    {% endif %}
{% endmacro %}
