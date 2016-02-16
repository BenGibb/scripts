import csv
from collections import namedtuple
import sqlite3


def getMinType(value):
    try:
        int(value)
        return "integer"
    except ValueError:
        pass
    try:
        float(value)
        return "real"
    except ValueError:
        pass
    return "text"


fname = 'ability_names'
with open('csv\\{0}.csv'.format(fname), encoding="utf8") as csvfile:
    rdr = csv.reader(csvfile)
    header = next(rdr)
    names = [name for name in header]
    recordType = namedtuple(fname, names)
    cols = len(header)
    types = ["integer"] * cols
    data = []
    for row in rdr:
        data.append(recordType._make(row))
        for col in range(cols):
            if types[col] == "text":
                continue
            colType = getMinType(row[col])
            if types[col] != colType:
                if colType == "text" or \
                        (colType == "real" and types[col] == "integer"):
                    types[col] = colType

conn = sqlite3.connect('pokemonData.db')
conn.execute('drop table {tableName}'.format(tableName=fname))
conn.execute('create table {tableName} (\n'.format(tableName=fname) +
             ',\n'.join("\t%s %s" % (i[0], i[1]) for i in zip(names, types)) +
             '\n);')
#conn.execute('INSERT INTO {tableName} VALUES ({cols})'.format(tableName=fname, cols=','.join(['?'] * cols)), data)

for i in data:
    conn.execute("INSERT INTO ability_names VALUES ({0}, {1}, '{2}')".format(*i))

conn.commit()