#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <QObject>
#include <QMetaObject>
#include <sailfishapp.h>
#include "counter.h"
#include "MyList.h"


int main(int argc, char *argv[])
{
    //QMetaObject *meta = List::metaObject();

    qmlRegisterType<Counter>("Counter", 1, 0, "Counter");
    qmlRegisterType<List>("List", 1, 0, "List");

    return SailfishApp::main(argc, argv);
}
