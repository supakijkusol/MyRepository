class textFileManagement:

    def reqresin_createTextFile(self, arrayList,filePath,fileName):
        text_thai = 'ทดสอบภาษาไทยนะจ๊ะ'
        print(arrayList)
        arrLength = len(arrayList)
        try:
            with open(filePath + '\\' + fileName, mode="w+", encoding='utf-8') as file:
                for i in range(arrLength):
                    id = arrayList[i]['id']
                    id_str = str(id)
                    email = arrayList[i]['email']
                    first_name = arrayList[i]['first_name']
                    last_name = arrayList[i]['last_name']
                    avatar = arrayList[i]['avatar']

                    # == write into text file ==
                    # listLine = [id_str, ',', email, ',', first_name, ',', last_name, ',', avatar, '\n']
                    listLine = [id_str, ',', email, ',', first_name, ',', last_name, ',', avatar, ',', text_thai, '\n']

                    file.writelines(listLine)
        except IOError as err:
            print(err)
        else:
            file.close()


    def thetestingworldapi_createTextFile(self, newUserObj,filePath,fileName):
        print(newUserObj)
        try:
            with open(filePath + '\\' + fileName, mode="w+", encoding='utf-8') as file:
                    id = newUserObj['id']
                    id_str = str(id)
                    first_name = newUserObj['first_name']
                    middle_name = newUserObj['middle_name']
                    last_name = newUserObj['last_name']
                    date_of_birth = newUserObj['date_of_birth']

                    # == write into text file ==
                    listLine = [id_str, ',', first_name, ',', middle_name, ',', last_name, ',', date_of_birth, '\n']

                    file.writelines(listLine)
        except IOError as err:
            print(err)
        else:
            file.close()

