#ifndef MYLIST_H
#define MYLIST_H
#include <QObject>
#include<QVector>

class List : public QObject
{
    Q_OBJECT
private:
    QVector<QString> list;
public:
    Q_INVOKABLE void push(QString el) {
        if(el == "")
            return;
        list.push_back(el.toLower());
        emit listChanged();
    }
    Q_INVOKABLE void pop() {
        if(list.isEmpty())
            return;
        list.pop_back();
        emit listChanged();
    }
    Q_INVOKABLE QString getList() {
        QString res;
        for(int i = 0; i < list.size(); i++) {
            if(i == 0) {
                list[i].replace(0, 1, list[i][0].toUpper());
            }
            if(i == list.size() - 1) {
                res += list[i];
            } else {
                res += list[i] + ", ";
            }
        }
        return res;
    }
signals:
    void listChanged();
};

#endif // MYLIST_H
