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

#ifndef DATASOURCE_H
#define DATASOURCE_H

#include <QtDataVisualization/QSurface3DSeries>

using namespace QtDataVisualization;

class DataSource : public QObject
{
    Q_OBJECT
public:
    explicit DataSource(QObject *parent = 0);
    virtual ~DataSource();

    //! [0]
public Q_SLOTS:
    void generateData(int cacheCount, int rowCount, int columnCount,
                      float xMin, float xMax, float yMin, float yMax, float zMin, float zMax);

    void update(QSurface3DSeries *series);
    //! [0]
private:
    void clearData();

    QVector<QSurfaceDataArray> m_data;
    int m_index;
    QSurfaceDataArray *m_resetArray;
};

#endif
