#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ getCount WRITE setCount NOTIFY countChanged)
private:
    int count;
public:
    Q_INVOKABLE void add() {
        count++;
        emit countChanged();
    }
    Q_INVOKABLE void reset() {
        count = 0;
        emit countChanged();
    }
    Q_INVOKABLE int getCount() {return count;}
    Q_INVOKABLE void setCount(int Count) {count = Count;}
signals:
    void countChanged();
};

#endif // COUNTER_H
