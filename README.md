# TemRole

## TODO

- confirmation no destroy
- adicionar genres
- CRUD de eventos
- Definir imagens default para coletivo e eventos

## Duvidas

- queremos um domain?
- fazer lista de interesses? (resposta: membership com accepted)
- como fazer invites para coletivos? (nova tabela)

## Notas das Páginas de Eventos

- No index, centralizar os cards.
- Como adicionar mais de um gênero por evento no seed

## DATATIME CONVERSIONS WITH .strfftime

%a - The abbreviated weekday name (`Sun'')
  %A - The  full  weekday  name (`Sunday'')
%b - The abbreviated month name (`Jan'')
  %B - The  full  month  name (`January'')
%c - The preferred local date and time representation
%d - Day of the month (01..31)
%H - Hour of the day, 24-hour clock (00..23)
%I - Hour of the day, 12-hour clock (01..12)
%j - Day of the year (001..366)
%m - Month of the year (01..12)
%M - Minute of the hour (00..59)
%p - Meridian indicator (`AM''  or  `PM'')
%S - Second of the minute (00..60)
%U - Week number of the current year,
starting with the first Sunday as the first
day of the first week (00..53)
%W - Week number of the current year,
starting with the first Monday as the first
day of the first week (00..53)
%w - Day of the week (Sunday is 0, 0..6)
%x - Preferred representation for the date alone, no time
%X - Preferred representation for the time alone, no date
%y - Year without a century (00..99)
%Y - Year with century
%Z - Time zone name
%% - Literal ``%'' character
