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

#include <QtDataVisualization/Q3DLight>

using namespace QtDataVisualization;

class tst_light: public QObject
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

private:
    Q3DLight *m_light;
};

void tst_light::initTestCase()
{
}

void tst_light::cleanupTestCase()
{
}

void tst_light::init()
{
    m_light = new Q3DLight();
}

void tst_light::cleanup()
{
    delete m_light;
}

void tst_light::construct()
{
    Q3DLight *light = new Q3DLight();
    QVERIFY(light);
    delete light;
}

void tst_light::initialProperties()
{
    QVERIFY(m_light);

    // TODO: Has no adjustable properties yet.
    // Keeping this as a placeholder for future implementations (QTRD-2406)

    // Common (from Q3DObject)
    QVERIFY(!m_light->parentScene());
    QCOMPARE(m_light->position(), QVector3D(0, 0, 0));
}

void tst_light::initializeProperties()
{
    QVERIFY(m_light);

    m_light->setPosition(QVector3D(1.0, 1.0, 1.0));

    // Common (from Q3DObject)
    QCOMPARE(m_light->position(), QVector3D(1.0, 1.0, 1.0));
}

QTEST_MAIN(tst_light)
#include "tst_light.moc"
