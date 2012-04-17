%modules = ( # path to module name map
    "QtQml" => "$basedir/src/qml",
    "QtQuick" => "$basedir/src/quick",
    "QtQuickParticles" => "$basedir/src/particles",
    "QtQuickTest" => "$basedir/src/qmltest",
    "QtQmlDevTools" => "$basedir/src/qmldevtools",
    "QtDeclarative" => "$basedir/src/compatibility",
);
%moduleheaders = ( # restrict the module headers to those found in relative path
    "QtQmlDevTools" => "../qml/qml/parser",
);
%classnames = (
    "qtqmlversion.h" => "QtQmlVersion",
    "qtdeclarativeversion.h" => "QtDeclarativeVersion",
);
%mastercontent = (
    "gui" => "#include <QtGui/QtGui>\n",
    "script" => "#include <QtScript/QtScript>\n",
    "network" => "#include <QtNetwork/QtNetwork>\n",
    "testlib" => "#include <QtTest/QtTest>\n",
    "qml" => "#include <QtQml/QtQml>\n",
    "quick" => "#include <QtQuick/QtQuick>\n",
);
%modulepris = (
    "QtQml" => "$basedir/modules/qt_qml.pri",
    "QtQuick" => "$basedir/modules/qt_quick.pri",
    "QtQuickParticles" => "$basedir/modules/qt_quickparticles.pri",
    "QtQuickTest" => "$basedir/modules/qt_qmltest.pri",
    "QtQmlDevTools" => "$basedir/modules/qt_qmldevtools.pri",
    "QtDeclarative" => "$basedir/modules/qt_declarative.pri",
);
%deprecatedheaders = (
    "QtDeclarative" => {
        "QtDeclarative" => "QtQml/QQml",
        "qdeclarative.h" => "QtQml/qqml.h",
        "qdeclarativeprivate.h" => "QtQml/qqmlprivate.h",
        "QDeclarativeAttachedPropertiesFunc" => "QtQml/QQmlAttachedPropertiesFunc",
        "QDeclarativeComponent" => "QtQml/QQmlComponent",
        "qdeclarativecomponent.h" => "QtQml/qqmlcomponent.h",
        "QDeclarativeContext" => "QtQml/QQmlContext",
        "qdeclarativecontext.h" => "QtQml/qqmlcontext.h",
        "QDeclarativeDebuggingEnabler" => "QtQml/QQmlDebuggingEnabler",
        "qdeclarativedebug.h" => "QtQml/qqmldebug.h",
        "QDeclarativeEngine" => "QtQml/QQmlEngine",
        "qdeclarativeengine.h" => "QtQml/qqmlengine.h",
        "QDeclarativeError" => "QtQml/QQmlError",
        "qdeclarativeerror.h" => "QtQml/qqmlerror.h",
        "QDeclarativeExpression" => "QtQml/QQmlExpression",
        "qdeclarativeexpression.h" => "QtQml/qqmlexpression.h",
        "QDeclarativeExtensionInterface" => "QtQml/QQmlExtensionInterface",
        "qdeclarativeextensioninterface.h" => "QtQml/qqmlextensioninterface.h",
        "QDeclarativeExtensionPlugin" => "QtQml/QQmlExtensionPlugin",
        "qdeclarativeextensionplugin.h" => "QtQml/qqmlextensionplugin.h",
        "QDeclarativeImageProvider" => "QtQuick/QQuickImageProvider",
        "qdeclarativeimageprovider.h" => "QtQuick/qquickimageprovider.h",
        "QDeclarativeIncubationController" => "QtQml/QQmlIncubationController",
        "QDeclarativeIncubator" => "QtQml/QQmlIncubator",
        "qdeclarativeincubator.h" => "QtQml/qqmlincubator.h",
        "QDeclarativeInfo" => "QtQml/QQmlInfo",
        "qdeclarativeinfo.h" => "QtQml/qqmlinfo.h",
        "qdeclarativelist.h" => "QtQml/qqmllist.h",
        "QDeclarativeListProperty" => "QtQml/QQmlListProperty",
        "QDeclarativeListReference" => "QtQml/QQmlListReference",
        "QDeclarativeNetworkAccessManagerFactory" => "QtQml/QQmlNetworkAccessManagerFactory",
        "qdeclarativenetworkaccessmanagerfactory.h" => "QtQml/qqmlnetworkaccessmanagerfactory.h",
        "QDeclarativeParserStatus" => "QtQml/QQmlParserStatus",
        "qdeclarativeparserstatus.h" => "QtQml/qqmlparserstatus.h",
        "QDeclarativeProperties" => "QtQml/QQuickProperties",
        "QDeclarativeProperty" => "QtQml/QQmlProperty",
        "qdeclarativeproperty.h" => "QtQml/qqmlproperty.h",
        "QDeclarativePropertyMap" => "QtQml/QQmlPropertyMap",
        "qdeclarativepropertymap.h" => "QtQml/qqmlpropertymap.h",
        "QDeclarativePropertyValueSource" => "QtQml/QQmlPropertyValueSource",
        "qdeclarativepropertyvaluesource.h" => "QtQml/qqmlpropertyvaluesource.h",
        "QDeclarativeScriptString" => "QtQml/QQmlScriptString",
        "qdeclarativescriptstring.h" => "QtQml/qqmlscriptstring.h",
        "QDeclarativeTextureFactory" => "QtQml/QQuickTextureFactory",
        "QDeclarativeTypeInfo" => "QtQml/QQmlTypeInfo",
        "QDeclarativeTypesExtensionInterface" => "QtQml/QQmlTypesExtensionInterface",
        "QJSEngine" => "QtQml/QJSEngine",
        "qjsengine.h" => "QtQml/qjsengine.h",
        "QJSValue" => "QtQml/QJSValue",
        "qjsvalue.h" => "QtQml/qjsvalue.h",
        "QJSValueIterator" => "QtQml/QJSValueIterator",
        "qjsvalueiterator.h" => "QtQml/qjsvalueiterator.h",
        "QJSValueList" => "QtQml/QJSValueList",
        "qintrusivelist_p.h" => "QtQml/private/qintrusivelist_p.h",
        "qjsconverter_impl_p.h" => "QtQml/private/qjsconverter_impl_p.h",
        "qjsconverter_p.h" => "QtQml/private/qjsconverter_p.h",
        "qjsengine_p.h" => "QtQml/private/qjsengine_p.h",
        "qjsvalue_impl_p.h" => "QtQml/private/qjsvalue_impl_p.h",
        "qjsvalueiterator_impl_p.h" => "QtQml/private/qjsvalueiterator_impl_p.h",
        "qjsvalueiterator_p.h" => "QtQml/private/qjsvalueiterator_p.h",
        "qjsvalue_p.h" => "QtQml/private/qjsvalue_p.h",
        "qlistmodelinterface_p.h" => "QtQml/private/qlistmodelinterface_p.h",
        "qpacketprotocol_p.h" => "QtQml/private/qpacketprotocol_p.h",
        "qparallelanimationgroupjob_p.h" => "QtQml/private/qparallelanimationgroupjob_p.h",
        "qpauseanimationjob_p.h" => "QtQml/private/qpauseanimationjob_p.h",
        "qpodvector_p.h" => "QtQml/private/qpodvector_p.h",
        "qdeclarativeaccessors_p.h" => "QtQml/private/qqmlaccessors_p.h",
        "qdeclarativebinding_p.h" => "QtQml/private/qqmlbinding_p.h",
        "qdeclarativebinding_p_p.h" => "QtQml/private/qqmlbinding_p_p.h",
        "qdeclarativeboundsignal_p.h" => "QtQml/private/qqmlboundsignal_p.h",
        "qdeclarativebuiltinfunctions_p.h" => "QtQml/private/qqmlbuiltinfunctions_p.h",
        "qdeclarativecleanup_p.h" => "QtQml/private/qqmlcleanup_p.h",
        "qdeclarativecompiler_p.h" => "QtQml/private/qqmlcompiler_p.h",
        "qdeclarativecomponentattached_p.h" => "QtQml/private/qqmlcomponentattached_p.h",
        "qdeclarativecomponent_p.h" => "QtQml/private/qqmlcomponent_p.h",
        "qdeclarativecontext_p.h" => "QtQml/private/qqmlcontext_p.h",
        "qdeclarativecustomparser_p.h" => "QtQml/private/qqmlcustomparser_p.h",
        "qdeclarativecustomparser_p_p.h" => "QtQml/private/qqmlcustomparser_p_p.h",
        "qdeclarativedata_p.h" => "QtQml/private/qqmldata_p.h",
        "qdeclarativedebugclient_p.h" => "QtQml/private/qqmldebugclient_p.h",
        "qdeclarativedebughelper_p.h" => "QtQml/private/qqmldebughelper_p.h",
        "qdeclarativedebugserverconnection_p.h" => "QtQml/private/qqmldebugserverconnection_p.h",
        "qdeclarativedebugserver_p.h" => "QtQml/private/qqmldebugserver_p.h",
        "qdeclarativedebugservice_p.h" => "QtQml/private/qqmldebugservice_p.h",
        "qdeclarativedebugservice_p_p.h" => "QtQml/private/qqmldebugservice_p_p.h",
        "qdeclarativedebugstatesdelegate_p.h" => "QtQml/private/qqmldebugstatesdelegate_p.h",
        "qdeclarativedirparser_p.h" => "QtQml/private/qqmldirparser_p.h",
        "qdeclarativeenginedebug_p.h" => "QtQml/private/qqmlenginedebug_p.h",
        "qdeclarativeenginedebugservice_p.h" => "QtQml/private/qqmlenginedebugservice_p.h",
        "qdeclarativeengine_p.h" => "QtQml/private/qqmlengine_p.h",
        "qdeclarativeexpression_p.h" => "QtQml/private/qqmlexpression_p.h",
        "qdeclarativeglobal_p.h" => "QtQml/private/qqmlglobal_p.h",
        "qdeclarativeguard_p.h" => "QtQml/private/qqmlguard_p.h",
        "qdeclarativeimport_p.h" => "QtQml/private/qqmlimport_p.h",
        "qdeclarativeincubator_p.h" => "QtQml/private/qqmlincubator_p.h",
        "qdeclarativeinspectorinterface_p.h" => "QtQml/private/qqmlinspectorinterface_p.h",
        "qdeclarativeinspectorservice_p.h" => "QtQml/private/qqmlinspectorservice_p.h",
        "qdeclarativeinstruction_p.h" => "QtQml/private/qqmlinstruction_p.h",
        "qdeclarativeintegercache_p.h" => "QtQml/private/qqmlintegercache_p.h",
        "qdeclarativejsastfwd_p.h" => "QtQml/private/qqmljsastfwd_p.h",
        "qdeclarativejsast_p.h" => "QtQml/private/qqmljsast_p.h",
        "qdeclarativejsastvisitor_p.h" => "QtQml/private/qqmljsastvisitor_p.h",
        "qdeclarativejsengine_p.h" => "QtQml/private/qqmljsengine_p.h",
        "qdeclarativejsglobal_p.h" => "QtQml/private/qqmljsglobal_p.h",
        "qdeclarativejsgrammar_p.h" => "QtQml/private/qqmljsgrammar_p.h",
        "qdeclarativejskeywords_p.h" => "QtQml/private/qqmljskeywords_p.h",
        "qdeclarativejslexer_p.h" => "QtQml/private/qqmljslexer_p.h",
        "qdeclarativejsmemorypool_p.h" => "QtQml/private/qqmljsmemorypool_p.h",
        "qdeclarativejsparser_p.h" => "QtQml/private/qqmljsparser_p.h",
        "qdeclarativelist_p.h" => "QtQml/private/qqmllist_p.h",
        "qdeclarativelocale_p.h" => "QtQml/private/qqmllocale_p.h",
        "qdeclarativemetatype_p.h" => "QtQml/private/qqmlmetatype_p.h",
        "qdeclarativenotifier_p.h" => "QtQml/private/qqmlnotifier_p.h",
        "qdeclarativenullablevalue_p_p.h" => "QtQml/private/qqmlnullablevalue_p_p.h",
        "qdeclarativeopenmetaobject_p.h" => "QtQml/private/qqmlopenmetaobject_p.h",
        "qdeclarativepool_p.h" => "QtQml/private/qqmlpool_p.h",
        "qdeclarativeprofilerservice_p.h" => "QtQml/private/qqmlprofilerservice_p.h",
        "qdeclarativepropertycache_p.h" => "QtQml/private/qqmlpropertycache_p.h",
        "qdeclarativeproperty_p.h" => "QtQml/private/qqmlproperty_p.h",
        "qdeclarativepropertyvalueinterceptor_p.h" => "QtQml/private/qqmlpropertyvalueinterceptor_p.h",
        "qdeclarativeproxymetaobject_p.h" => "QtQml/private/qqmlproxymetaobject_p.h",
        "qdeclarativerefcount_p.h" => "QtQml/private/qqmlrefcount_p.h",
        "qdeclarativerewrite_p.h" => "QtQml/private/qqmlrewrite_p.h",
        "qdeclarativescript_p.h" => "QtQml/private/qqmlscript_p.h",
        "qdeclarativescriptstring_p.h" => "QtQml/private/qqmlscriptstring_p.h",
        "qdeclarativestringconverters_p.h" => "QtQml/private/qqmlstringconverters_p.h",
        "qdeclarativethread_p.h" => "QtQml/private/qqmlthread_p.h",
        "qdeclarativetrace_p.h" => "QtQml/private/qqmltrace_p.h",
        "qdeclarativetypeloader_p.h" => "QtQml/private/qqmltypeloader_p.h",
        "qdeclarativetypenamecache_p.h" => "QtQml/private/qqmltypenamecache_p.h",
        "qdeclarativetypenotavailable_p.h" => "QtQml/private/qqmltypenotavailable_p.h",
        "qdeclarativevaluetype_p.h" => "QtQml/private/qqmlvaluetype_p.h",
        "qdeclarativevmemetaobject_p.h" => "QtQml/private/qqmlvmemetaobject_p.h",
        "qdeclarativevme_p.h" => "QtQml/private/qqmlvme_p.h",
        "qdeclarativewatcher_p.h" => "QtQml/private/qqmlwatcher_p.h",
        "qdeclarativexmlhttprequest_p.h" => "QtQml/private/qqmlxmlhttprequest_p.h",
        "qdeclarativeapplication_p.h" => "QtQml/private/qquickapplication_p.h",
        "qdeclarativelistmodel_p.h" => "QtQml/private/qquicklistmodel_p.h",
        "qdeclarativelistmodel_p_p.h" => "QtQml/private/qquicklistmodel_p_p.h",
        "qdeclarativelistmodelworkeragent_p.h" => "QtQml/private/qquicklistmodelworkeragent_p.h",
        "qdeclarativeworkerscript_p.h" => "QtQml/private/qquickworkerscript_p.h",
        "qrecursionwatcher_p.h" => "QtQml/private/qrecursionwatcher_p.h",
        "qrecyclepool_p.h" => "QtQml/private/qrecyclepool_p.h",
        "qscript_impl_p.h" => "QtQml/private/qscript_impl_p.h",
        "qscriptisolate_p.h" => "QtQml/private/qscriptisolate_p.h",
        "qscriptoriginalglobalobject_p.h" => "QtQml/private/qscriptoriginalglobalobject_p.h",
        "qscriptshareddata_p.h" => "QtQml/private/qscriptshareddata_p.h",
        "qscripttools_p.h" => "QtQml/private/qscripttools_p.h",
        "qsequentialanimationgroupjob_p.h" => "QtQml/private/qsequentialanimationgroupjob_p.h",
        "qv4bindings_p.h" => "QtQml/private/qv4bindings_p.h",
        "qv4compiler_p.h" => "QtQml/private/qv4compiler_p.h",
        "qv4compiler_p_p.h" => "QtQml/private/qv4compiler_p_p.h",
        "qv4instruction_p.h" => "QtQml/private/qv4instruction_p.h",
        "qv4irbuilder_p.h" => "QtQml/private/qv4irbuilder_p.h",
        "qv4ir_p.h" => "QtQml/private/qv4ir_p.h",
        "qv4program_p.h" => "QtQml/private/qv4program_p.h",
        "qv8bindings_p.h" => "QtQml/private/qv8bindings_p.h",
        "qv8contextwrapper_p.h" => "QtQml/private/qv8contextwrapper_p.h",
        "qv8debug_p.h" => "QtQml/private/qv8debug_p.h",
        "qv8debugservice_p.h" => "QtQml/private/qv8debugservice_p.h",
        "qv8domerrors_p.h" => "QtQml/private/qv8domerrors_p.h",
        "qv8engine_impl_p.h" => "QtQml/private/qv8engine_impl_p.h",
        "qv8engine_p.h" => "QtQml/private/qv8engine_p.h",
        "qv8include_p.h" => "QtQml/private/qv8include_p.h",
        "qv8listwrapper_p.h" => "QtQml/private/qv8listwrapper_p.h",
        "qv8_p.h" => "QtQml/private/qv8_p.h",
        "qv8profiler_p.h" => "QtQml/private/qv8profiler_p.h",
        "qv8profilerservice_p.h" => "QtQml/private/qv8profilerservice_p.h",
        "qv8qobjectwrapper_p.h" => "QtQml/private/qv8qobjectwrapper_p.h",
        "qv8sequencewrapper_p.h" => "QtQml/private/qv8sequencewrapper_p.h",
        "qv8sequencewrapper_p_p.h" => "QtQml/private/qv8sequencewrapper_p_p.h",
        "qv8sqlerrors_p.h" => "QtQml/private/qv8sqlerrors_p.h",
        "qv8stringwrapper_p.h" => "QtQml/private/qv8stringwrapper_p.h",
        "qv8typewrapper_p.h" => "QtQml/private/qv8typewrapper_p.h",
        "qv8valuetypewrapper_p.h" => "QtQml/private/qv8valuetypewrapper_p.h",
        "qv8variantresource_p.h" => "QtQml/private/qv8variantresource_p.h",
        "qv8variantwrapper_p.h" => "QtQml/private/qv8variantwrapper_p.h",
        "qv8worker_p.h" => "QtQml/private/qv8worker_p.h",
        "textwriter_p.h" => "QtQml/private/textwriter_p.h",
    },
    "QtQml" => {
        "QQmlImageProvider" => "QtQuick/QQuickImageProvider",
        "qqmlimageprovider.h" => "QtQuick/qquickimageprovider.h",
    },
);
# Module dependencies.
# Every module that is required to build this module should have one entry.
# Each of the module version specifiers can take one of the following values:
#   - A specific Git revision.
#   - any git symbolic ref resolvable from the module's repository (e.g. "refs/heads/master" to track master branch)
#
%dependencies = (
        "qtbase" => "refs/heads/master",
        "qtxmlpatterns" => "refs/heads/master",
        "qtjsbackend" => "refs/heads/master",
);
