/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QtQml module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QV4SEQUENCEWRAPPER_P_H
#define QV4SEQUENCEWRAPPER_P_H

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

#include <QtCore/qglobal.h>
#include <QtCore/qvariant.h>

#include "qv4value_p.h"
#include "qv4object_p.h"

QT_BEGIN_NAMESPACE

namespace QV4 {

struct SequencePrototype : public QV4::Object
{
    SequencePrototype(QV4::ExecutionEngine *engine);

    void init(QV4::ExecutionEngine *engine);

    static QV4::Value method_valueOf(QV4::SimpleCallContext *ctx)
    {
        return QV4::Value::fromString(ctx->thisObject.toString(ctx));
    }

    static QV4::Value method_sort(QV4::SimpleCallContext *ctx);

    static bool isSequenceType(int sequenceTypeId);
    static QV4::Value newSequence(QV4::ExecutionEngine *engine, int sequenceTypeId, QObject *object, int propertyIndex, bool *succeeded);
    static QV4::Value fromVariant(QV4::ExecutionEngine *engine, const QVariant& v, bool *succeeded);
    static int metaTypeForSequence(QV4::Object *object);
    static QVariant toVariant(QV4::Object *object);
    static QVariant toVariant(const QV4::Value &array, int typeHint, bool *succeeded);
};

}

QT_END_NAMESPACE

#endif // QV4SEQUENCEWRAPPER_P_H