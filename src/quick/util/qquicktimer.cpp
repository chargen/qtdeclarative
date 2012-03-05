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

#include "qquicktimer_p.h"

#include <QtCore/qcoreapplication.h>
#include "private/qpauseanimationjob_p.h"
#include <qdebug.h>

#include <private/qobject_p.h>

QT_BEGIN_NAMESPACE



class QQuickTimerPrivate : public QObjectPrivate, public QAnimationJobChangeListener
{
    Q_DECLARE_PUBLIC(QQuickTimer)
public:
    QQuickTimerPrivate()
        : interval(1000), running(false), repeating(false), triggeredOnStart(false)
        , classBegun(false), componentComplete(false), firstTick(true) {}

    virtual void animationFinished(QAbstractAnimationJob *);
    virtual void animationCurrentLoopChanged(QAbstractAnimationJob *)  { Q_Q(QQuickTimer); q->ticked(); }

    int interval;
    QPauseAnimationJob pause;
    bool running : 1;
    bool repeating : 1;
    bool triggeredOnStart : 1;
    bool classBegun : 1;
    bool componentComplete : 1;
    bool firstTick : 1;
};

/*!
    \qmlclass Timer QQuickTimer
    \inqmlmodule QtQuick 2
    \ingroup qml-utility-elements
    \brief The Timer item triggers a handler at a specified interval.

    A Timer can be used to trigger an action either once, or repeatedly
    at a given interval.

    Here is a Timer that shows the current date and time, and updates
    the text every 500 milliseconds. It uses the JavaScript \c Date
    object to access the current time.

    \qml
    import QtQuick 2.0

    Item {
        Timer {
            interval: 500; running: true; repeat: true
            onTriggered: time.text = Date().toString()
        }

        Text { id: time }
    }
    \endqml

    The Timer element is synchronized with the animation timer.  Since the animation
    timer is usually set to 60fps, the resolution of Timer will be
    at best 16ms.

    If the Timer is running and one of its properties is changed, the
    elapsed time will be reset.  For example, if a Timer with interval of
    1000ms has its \e repeat property changed 500ms after starting, the
    elapsed time will be reset to 0, and the Timer will be triggered
    1000ms later.

    \sa {declarative/toys/clocks}{Clocks example}
*/

QQuickTimer::QQuickTimer(QObject *parent)
    : QObject(*(new QQuickTimerPrivate), parent)
{
    Q_D(QQuickTimer);
    d->pause.addAnimationChangeListener(d, QAbstractAnimationJob::Completion | QAbstractAnimationJob::CurrentLoop);
    d->pause.setLoopCount(1);
    d->pause.setDuration(d->interval);
}

/*!
    \qmlproperty int QtQuick2::Timer::interval

    Sets the \a interval between triggers, in milliseconds.

    The default interval is 1000 milliseconds.
*/
void QQuickTimer::setInterval(int interval)
{
    Q_D(QQuickTimer);
    if (interval != d->interval) {
        d->interval = interval;
        update();
        emit intervalChanged();
    }
}

int QQuickTimer::interval() const
{
    Q_D(const QQuickTimer);
    return d->interval;
}

/*!
    \qmlproperty bool QtQuick2::Timer::running

    If set to true, starts the timer; otherwise stops the timer.
    For a non-repeating timer, \a running is set to false after the
    timer has been triggered.

    \a running defaults to false.

    \sa repeat
*/
bool QQuickTimer::isRunning() const
{
    Q_D(const QQuickTimer);
    return d->running;
}

void QQuickTimer::setRunning(bool running)
{
    Q_D(QQuickTimer);
    if (d->running != running) {
        d->running = running;
        d->firstTick = true;
        emit runningChanged();
        update();
    }
}

/*!
    \qmlproperty bool QtQuick2::Timer::repeat

    If \a repeat is true the timer is triggered repeatedly at the
    specified interval; otherwise, the timer will trigger once at the
    specified interval and then stop (i.e. running will be set to false).

    \a repeat defaults to false.

    \sa running
*/
bool QQuickTimer::isRepeating() const
{
    Q_D(const QQuickTimer);
    return d->repeating;
}

void QQuickTimer::setRepeating(bool repeating)
{
    Q_D(QQuickTimer);
    if (repeating != d->repeating) {
        d->repeating = repeating;
        update();
        emit repeatChanged();
    }
}

/*!
    \qmlproperty bool QtQuick2::Timer::triggeredOnStart

    When a timer is started, the first trigger is usually after the specified
    interval has elapsed.  It is sometimes desirable to trigger immediately
    when the timer is started; for example, to establish an initial
    state.

    If \a triggeredOnStart is true, the timer is triggered immediately
    when started, and subsequently at the specified interval. Note that if
    \e repeat is set to false, the timer is triggered twice; once on start,
    and again at the interval.

    \a triggeredOnStart defaults to false.

    \sa running
*/
bool QQuickTimer::triggeredOnStart() const
{
    Q_D(const QQuickTimer);
    return d->triggeredOnStart;
}

void QQuickTimer::setTriggeredOnStart(bool triggeredOnStart)
{
    Q_D(QQuickTimer);
    if (d->triggeredOnStart != triggeredOnStart) {
        d->triggeredOnStart = triggeredOnStart;
        update();
        emit triggeredOnStartChanged();
    }
}

/*!
    \qmlmethod QtQuick2::Timer::start()
    \brief Starts the timer.

    If the timer is already running, calling this method has no effect.  The
    \c running property will be true following a call to \c start().
*/
void QQuickTimer::start()
{
    setRunning(true);
}

/*!
    \qmlmethod QtQuick2::Timer::stop()
    \brief Stops the timer.

    If the timer is not running, calling this method has no effect.  The
    \c running property will be false following a call to \c stop().
*/
void QQuickTimer::stop()
{
    setRunning(false);
}

/*!
    \qmlmethod QtQuick2::Timer::restart()
    \brief Restarts the timer.

    If the Timer is not running it will be started, otherwise it will be
    stopped, reset to initial state and started.  The \c running property
    will be true following a call to \c restart().
*/
void QQuickTimer::restart()
{
    setRunning(false);
    setRunning(true);
}

void QQuickTimer::update()
{
    Q_D(QQuickTimer);
    if (d->classBegun && !d->componentComplete)
        return;
    d->pause.stop();
    if (d->running) {
        d->pause.setCurrentTime(0);
        d->pause.setLoopCount(d->repeating ? -1 : 1);
        d->pause.setDuration(d->interval);
        d->pause.start();
        if (d->triggeredOnStart && d->firstTick) {
            QCoreApplication::removePostedEvents(this, QEvent::MetaCall);
            QMetaObject::invokeMethod(this, "ticked", Qt::QueuedConnection);
        }
    }
}

void QQuickTimer::classBegin()
{
    Q_D(QQuickTimer);
    d->classBegun = true;
}

void QQuickTimer::componentComplete()
{
    Q_D(QQuickTimer);
    d->componentComplete = true;
    update();
}

/*!
    \qmlsignal QtQuick2::Timer::onTriggered()

    This handler is called when the Timer is triggered.
*/
void QQuickTimer::ticked()
{
    Q_D(QQuickTimer);
    if (d->running && (d->pause.currentTime() > 0 || (d->triggeredOnStart && d->firstTick)))
        emit triggered();
    d->firstTick = false;
}

void QQuickTimerPrivate::animationFinished(QAbstractAnimationJob *)
{
    Q_Q(QQuickTimer);
    if (repeating || !running)
        return;
    running = false;
    firstTick = false;
    emit q->triggered();
    emit q->runningChanged();
}

QT_END_NAMESPACE