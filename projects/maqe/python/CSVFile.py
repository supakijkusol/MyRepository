def readCSVFile(fileName):
    try:
        filePath = 'D:\Work\Automation_Test\RobotFramework\MyRepository\projects\maqe\data_test'
        csvFilePath = filePath + '\\' + fileName
        file = open(csvFilePath, mode='r', encoding='utf-8')

        # print(file.read())
        # return file.read()

        # print(file.read().splitlines())
        return file.read().splitlines()

        file.close()
    except IOError as err:
        print(err)
        file.close()



