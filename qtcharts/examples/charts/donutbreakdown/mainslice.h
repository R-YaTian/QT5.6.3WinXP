/******************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Charts module.
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

#ifndef MAINSLICE_H
#define MAINSLICE_H

#include <QtCharts/QPieSlice>
#include <QtCharts/QPieSeries>

QT_CHARTS_USE_NAMESPACE

class MainSlice : public QPieSlice
{
    Q_OBJECT
public:
    MainSlice(QPieSeries *breakdownSeries, QObject *parent = 0);

    QPieSeries *breakdownSeries() const;

    void setName(QString name);
    QString name() const;

public Q_SLOTS:
    void updateLabel();

private:
    QPieSeries *m_breakdownSeries;
    QString m_name;
};

#endif // MAINSLICE_H