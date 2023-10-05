/******************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Data Visualization module.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
******************************************************************************/

#include <QtTest/QtTest>

#include <QtDataVisualization/QHeightMapSurfaceDataProxy>

using namespace QtDataVisualization;

class tst_proxy: public QObject
{
    Q_OBJECT

private slots:
    void initTestCase();
    void cleanupTestCase();
    void init();
    void cleanup();

    void construct();

    void initialProperties();
    void initializeProperties();
    void invalidProperties();

private:
    QHeightMapSurfaceDataProxy *m_proxy;
};

void tst_proxy::initTestCase()
{
}

void tst_proxy::cleanupTestCase()
{
}

void tst_proxy::init()
{
    m_proxy = new QHeightMapSurfaceDataProxy();
}

void tst_proxy::cleanup()
{
    delete m_proxy;
}

void tst_proxy::construct()
{
    QHeightMapSurfaceDataProxy *proxy = new QHeightMapSurfaceDataProxy();
    QVERIFY(proxy);
    delete proxy;

    QImage image(QSize(10, 10), QImage::Format_ARGB32);
    image.fill(0);
    proxy = new QHeightMapSurfaceDataProxy(image);
    QVERIFY(proxy);
    QCoreApplication::processEvents();
    QCOMPARE(proxy->columnCount(), 10);
    QCOMPARE(proxy->rowCount(), 10);
    delete proxy;

    proxy = new QHeightMapSurfaceDataProxy(":/customtexture.jpg");
    QVERIFY(proxy);
    QCoreApplication::processEvents();
    QCOMPARE(proxy->columnCount(), 24);
    QCOMPARE(proxy->rowCount(), 24);
    delete proxy;
}

void tst_proxy::initialProperties()
{
    QVERIFY(m_proxy);

    QCOMPARE(m_proxy->heightMap(), QImage());
    QCOMPARE(m_proxy->heightMapFile(), QString(""));
    QCOMPARE(m_proxy->maxXValue(), 10.0f);
    QCOMPARE(m_proxy->maxZValue(), 10.0f);
    QCOMPARE(m_proxy->minXValue(), 0.0f);
    QCOMPARE(m_proxy->minZValue(), 0.0f);

    QCOMPARE(m_proxy->columnCount(), 0);
    QCOMPARE(m_proxy->rowCount(), 0);
    QVERIFY(!m_proxy->series());

    QCOMPARE(m_proxy->type(), QAbstractDataProxy::DataTypeSurface);
}

void tst_proxy::initializeProperties()
{
    QVERIFY(m_proxy);

    m_proxy->setHeightMapFile(":/customtexture.jpg");
    m_proxy->setMaxXValue(11.0f);
    m_proxy->setMaxZValue(11.0f);
    m_proxy->setMinXValue(-10.0f);
    m_proxy->setMinZValue(-10.0f);

    QCoreApplication::processEvents();

    QCOMPARE(m_proxy->heightMapFile(), QString(":/customtexture.jpg"));
    QCOMPARE(m_proxy->maxXValue(), 11.0f);
    QCOMPARE(m_proxy->maxZValue(), 11.0f);
    QCOMPARE(m_proxy->minXValue(), -10.0f);
    QCOMPARE(m_proxy->minZValue(), -10.0f);

    QCOMPARE(m_proxy->columnCount(), 24);
    QCOMPARE(m_proxy->rowCount(), 24);

    m_proxy->setHeightMapFile("");

    QCoreApplication::processEvents();

    QCOMPARE(m_proxy->columnCount(), 0);
    QCOMPARE(m_proxy->rowCount(), 0);

    m_proxy->setHeightMap(QImage(":/customtexture.jpg"));

    QCoreApplication::processEvents();

    QCOMPARE(m_proxy->columnCount(), 24);
    QCOMPARE(m_proxy->rowCount(), 24);
}

void tst_proxy::invalidProperties()
{
    m_proxy->setMaxXValue(-10.0f);
    m_proxy->setMaxZValue(-10.0f);
    QCOMPARE(m_proxy->maxXValue(), -10.0f);
    QCOMPARE(m_proxy->maxZValue(), -10.0f);
    QCOMPARE(m_proxy->minXValue(), -11.0f);
    QCOMPARE(m_proxy->minZValue(), -11.0f);

    m_proxy->setMinXValue(10.0f);
    m_proxy->setMinZValue(10.0f);
    QCOMPARE(m_proxy->maxXValue(), 11.0f);
    QCOMPARE(m_proxy->maxZValue(), 11.0f);
    QCOMPARE(m_proxy->minXValue(), 10.0f);
    QCOMPARE(m_proxy->minZValue(), 10.0f);
}

QTEST_MAIN(tst_proxy)
#include "tst_proxy.moc"
