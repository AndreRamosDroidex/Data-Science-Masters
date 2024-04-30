def cases(estado):
    match estado:
        case 123:
            print(estado, 123)
        case 234:
            print(estado, 234)
        case _:
            print('nada')