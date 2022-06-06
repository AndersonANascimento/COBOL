

## Comando para compilar programa COBOL

<code>
$ cobc -x -o bin/PGMENULS src/PGMENULS.CBL
</code>

## Comando para compilar módulo COBOL(DLL)

<code>
$ cobc -m -o bin/PGCALC01 src/PGCALC01.CBL
</code>

## Comando para compilar programa COBOL com link static (DLL)

<code>
$ cobc -x -o bin/PGMENULS src/PGMENULS.CBL bin/PGCALC01.so
</code>
