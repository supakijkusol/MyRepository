def readCSVFile(filePath,fileName):
    try:
        csvFilePath = filePath + '\\' + fileName
        file = open(csvFilePath, mode='r', encoding='utf-8')
        # print(file.read().splitlines())
        return file.read().splitlines()
        file.close()
    except IOError as err:
        print(err)
        file.close()



