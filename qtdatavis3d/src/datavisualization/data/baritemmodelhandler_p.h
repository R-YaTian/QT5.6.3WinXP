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

//
//  W A R N I N G
//  -------------
//
// This file is not part of the QtDataVisualization API.  It exists purely as an
// implementation detail.  This header file may change from version to
// version without notice, or even be removed.
//
// We mean it.

#ifndef BARITEMMODELHANDLER_P_H
#define BARITEMMODELHANDLER_P_H

#include "abstractitemmodelhandler_p.h"
#include "qitemmodelbardataproxy_p.h"

QT_BEGIN_NAMESPACE_DATAVISUALIZATION

class BarItemModelHandler : public AbstractItemModelHandler
{
    Q_OBJECT
public:
    BarItemModelHandler(QItemModelBarDataProxy *proxy, QObject *parent = 0);
    virtual ~BarItemModelHandler();

public Q_SLOTS:
    virtual void handleDataChanged(const QModelIndex &topLeft, const QModelIndex &bottomRight,
                                   const QVector<int> &roles = QVector<int> ());

protected:
    void virtual resolveModel();

    QItemModelBarDataProxy *m_proxy; // Not owned
    QBarDataArray *m_proxyArray; // Not owned
    int m_columnCount;
    int m_valueRole;
    int m_rotationRole;
    QRegExp m_valuePattern;
    QRegExp m_rotationPattern;
    QString m_valueReplace;
    QString m_rotationReplace;
    bool m_haveValuePattern;
    bool m_haveRotationPattern;
};

QT_END_NAMESPACE_DATAVISUALIZATION

#endif
