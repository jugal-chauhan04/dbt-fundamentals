{% macro cents_to_dollars(column_name, decimal=2) %}
  {#
    Converts a numeric value in cents to dollars.
    Usage:
      select {{ cents_to_dollars('amount_cents') }} as amount_dollars
    It handles nulls gracefully.
  #}
    round( {{ column_name }} * 1.00 / 100.0, {{ decimal }} )
  
{% endmacro %}
