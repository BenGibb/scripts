import csv
import sqlite3
import os

dropTables = True

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

def processFile(path):
    with open(path, encoding="utf8") as csvfile:
        rdr = csv.reader(csvfile)
        header = next(rdr)
        names = [name for name in header]
        cols = len(header)
        types = ["integer"] * cols
        data = []
        for row in rdr:
            data.append(row)
            for col in range(cols):
                if types[col] == "text":
                    continue
                colType = getMinType(row[col])
                if types[col] != colType:
                    if colType == "text" or \
                            (colType == "real" and types[col] == "integer"):
                        types[col] = colType
        return names, types, data

def writeFile(db, tableName, names, types, data):
    cols = len(names)
    if dropTables:
        try:
            conn.execute('drop table {tableName}'.format(tableName=tableName))
        except:
            pass
    db.execute('create table {tableName} (\n'.format(tableName=tableName) +
                 ',\n'.join("\t%s %s" % (i[0], i[1]) for i in zip(names, types)) +
                 '\n);')
    db.executemany('INSERT INTO {tableName} VALUES ({cols})'
                   .format(tableName=tableName, cols=','.join(['?'] * cols)),
                   data)

def readWrite(db, fileName):
    path = 'csv\\{0}.csv'.format(fileName)
    writeFile(db, fileName, *processFile(path))

def processFile(path):
    name = os.path.splitext(os.path.basename(path))[0]


conn = sqlite3.connect('pokemonData.db')

for f in ['genders', 'berries', 'ability_names', 'item_fling_effect_prose']:
    readWrite(conn, f)

conn.commit()