/****************************************************************************
**
** Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/
**
** This file is part of the QtQml module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QQMLINSPECTORSERVICE_H
#define QQMLINSPECTORSERVICE_H

//
//  W A R N I N G
//  -------------
//
// This file is not part of the Qt API.  It exists purely as an
// implementation detail.  This header file may change from version to
// version without notice, or even be removed.
//
// We mean it.
//

#include "qqmldebugservice_p.h"

#include <QtQml/qtqmlglobal.h>
#include <QtCore/QList>

QT_BEGIN_HEADER

QT_BEGIN_NAMESPACE


class QQmlInspectorInterface;

class Q_QML_EXPORT QQmlInspectorService : public QQmlDebugService
{
    Q_OBJECT

public:
    QQmlInspectorService();
    static QQmlInspectorService *instance();

    void addView(QObject *);
    void removeView(QObject *);

    void sendMessage(const QByteArray &message);

protected:
    virtual void stateChanged(State state);
    virtual void messageReceived(const QByteArray &);

private slots:
    void processMessage(const QByteArray &message);
    void updateState();

private:
    void loadInspectorPlugins();

    QList<QObject*> m_views;
    QQmlInspectorInterface *m_currentInspectorPlugin;
    QList<QQmlInspectorInterface*> m_inspectorPlugins;
};

QT_END_NAMESPACE

QT_END_HEADER

#endif // QQMLINSPECTORSERVICE_H