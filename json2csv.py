import json
import csv
import pandas as pd

with open('formal_record.json') as file:
    data = json.load(file)
    file.close()

fname = "testing_record.csv"

with open(fname, "w", newline='') as file:
    csv_file = csv.writer(file)
    csv_file.writerow(['ID',
                       'route',
                       'condition',
                       'order',
                       'distanceMoved',
                       'taskTime',
                       'pickUpNumber',
                       'phoneActiveTime',
                       'angleDiff',
                       'distanceDiff'])

    for item in data["recordList"]:
        if item['isTesting']:
            csv_file.writerow([item['ID'],
                        item['route'],
                        item['condition'],
                        item['order'],
                        item['distanceMoved'],
                        item['taskTime'],
                        item['pickUpNumber'],
                        item['phoneActiveTime'],
                        item['angleDiff'],
                        item['distanceDiff']])

file.close()

with open('formal_record.json') as file:
    data = json.load(file)
    file.close()
fname = "practice_record.csv"

with open(fname, "w", newline='') as file:
    csv_file = csv.writer(file)
    csv_file.writerow(['ID',
                       'route',
                       'condition',
                       'order',
                       'distanceMoved',
                       'taskTime'])

    for item in data["recordList"]:
        if not item['isTesting']:
            csv_file.writerow([item['ID'],
                        item['route'],
                        item['condition'],
                        item['order'],
                        item['distanceMoved'],
                        item['taskTime']])