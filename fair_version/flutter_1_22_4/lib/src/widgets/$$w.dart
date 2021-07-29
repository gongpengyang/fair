/*
 * Copyright (C) 2005-present, 58.com.  All rights reserved.
 * Use of this source code is governed by a BSD type license that can be
 * found in the LICENSE file.
 */

import 'dart:io';

import 'package:flutter/material.dart';

import 'utils.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;
import 'package:flutter_redux/flutter_redux.dart';

part "../part/w.part.dart";

const double kMiddleSpacing = 16.0;
const Color _kColor = Color(0xA0B71C1C);
const double _kHeight = 12.0; // height of banner
const TextStyle _kTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: _kHeight * 0.85,
  fontWeight: FontWeight.w900,
  height: 1.0,
);

var context = {};
var p = () =>
{
  'AbsorbPointer': (props) =>
      AbsorbPointer(
        key: props['key'],
        absorbing: props['absorbing'] ?? true,
        child: props['child'],
        ignoringSemantics: props['ignoringSemantics'],
      ),
  'Align': (props) =>
      Align(
        key: props['key'],
        alignment: props['alignment'] ?? Alignment.center,
        widthFactor: props['widthFactor']?.toDouble(),
        heightFactor: props['heightFactor']?.toDouble(),
        child: props['child'],
      ),
  'AspectRatio': (props) =>
      AspectRatio(
        key: props['key'],
        aspectRatio: props['aspectRatio']?.toDouble(),
        child: props['child'],
      ),
  'BackdropFilter': (props) =>
      BackdropFilter(
        key: props['key'],
        filter: props['filter'],
        child: props['child'],
      ),
  'Baseline': (props) =>
      Baseline(
        key: props['key'],
        baseline: props['baseline']?.toDouble(),
        baselineType: props['baselineType'],
        child: props['child'],
      ),
  'BlockSemantics': (props) =>
      BlockSemantics(
        key: props['key'],
        blocking: props['blocking'] ?? true,
        child: props['child'],
      ),
  'Builder': (props) =>
      Builder(
        key: props['key'],
        builder: props['builder'],
      ),
  'Center': (props) =>
      Center(
        key: props['key'],
        widthFactor: props['widthFactor']?.toDouble(),
        heightFactor: props['heightFactor']?.toDouble(),
        child: props['child'],
      ),
  'ClipOval': (props) =>
      ClipOval(
        key: props['key'],
        clipper: props['clipper'],
        clipBehavior: props['clipBehavior'] ?? Clip.antiAlias,
        child: props['child'],
      ),
  'ClipPath': (props) =>
      ClipPath(
        key: props['key'],
        clipper: props['clipper'],
        clipBehavior: props['clipBehavior'] ?? Clip.antiAlias,
        child: props['child'],
      ),
  'ClipRRect': (props) =>
      ClipRRect(
        key: props['key'],
        borderRadius: props['borderRadius'] ?? BorderRadius.zero,
        clipper: props['clipper'],
        clipBehavior: props['clipBehavior'] ?? Clip.antiAlias,
        child: props['child'],
      ),
  'ClipRect': (props) =>
      ClipRect(
        key: props['key'],
        clipper: props['clipper'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        child: props['child'],
      ),
  'ColoredBox': (props) =>
      ColoredBox(
        color: props['color'],
        child: props['child'],
        key: props['key'],
      ),
  'Column': (props) =>
      Column(
        key: props['key'],
        mainAxisAlignment:
        props['mainAxisAlignment'] ?? MainAxisAlignment.start,
        mainAxisSize: props['mainAxisSize'] ?? MainAxisSize.max,
        crossAxisAlignment:
        props['crossAxisAlignment'] ?? CrossAxisAlignment.center,
        textDirection: props['textDirection'],
        verticalDirection:
        props['verticalDirection'] ?? VerticalDirection.down,
        textBaseline: props['textBaseline'],
        children: props['children'] ?? const <Widget>[],
      ),
  'CompositedTransformFollower': (props) =>
      CompositedTransformFollower(
        key: props['key'],
        link: props['link'],
        showWhenUnlinked: props['showWhenUnlinked'] ?? true,
        offset: props['offset'] ?? Offset.zero,
        child: props['child'],
      ),
  'CompositedTransformTarget': (props) =>
      CompositedTransformTarget(
        key: props['key'],
        link: props['link'],
        child: props['child'],
      ),
  'ConstrainedBox': (props) =>
      ConstrainedBox(
        key: props['key'],
        constraints: props['constraints'],
        child: props['child'],
      ),
  'CustomMultiChildLayout': (props) =>
      CustomMultiChildLayout(
        key: props['key'],
        delegate: props['delegate'],
        children: props['children'] ?? const <Widget>[],
      ),
  'CustomPaint': (props) =>
      CustomPaint(
        key: props['key'],
        painter: props['painter'],
        foregroundPainter: props['foregroundPainter'],
        size: props['size'] ?? Size.zero,
        isComplex: props['isComplex'] ?? false,
        willChange: props['willChange'] ?? false,
        child: props['child'],
      ),
  'CustomSingleChildLayout': (props) =>
      CustomSingleChildLayout(
        key: props['key'],
        delegate: props['delegate'],
        child: props['child'],
      ),
  'DefaultAssetBundle': (props) =>
      DefaultAssetBundle(
        key: props['key'],
        bundle: props['bundle'],
        child: props['child'],
      ),
  'Directionality': (props) =>
      Directionality(
        key: props['key'],
        textDirection: props['textDirection'],
        child: props['child'],
      ),
  'ExcludeSemantics': (props) =>
      ExcludeSemantics(
        key: props['key'],
        excluding: props['excluding'] ?? true,
        child: props['child'],
      ),
  'Expanded': (props) =>
      Expanded(
        key: props['key'],
        flex: props['flex'] ?? 1,
        child: props['child'],
      ),
  'FittedBox': (props) =>
      FittedBox(
        key: props['key'],
        fit: props['fit'] ?? BoxFit.contain,
        alignment: props['alignment'] ?? Alignment.center,
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        child: props['child'],
      ),
  'Flex': (props) =>
      Flex(
        key: props['key'],
        direction: props['direction'],
        mainAxisAlignment:
        props['mainAxisAlignment'] ?? MainAxisAlignment.start,
        mainAxisSize: props['mainAxisSize'] ?? MainAxisSize.max,
        crossAxisAlignment:
        props['crossAxisAlignment'] ?? CrossAxisAlignment.center,
        textDirection: props['textDirection'],
        verticalDirection:
        props['verticalDirection'] ?? VerticalDirection.down,
        textBaseline: props['textBaseline'] ?? TextBaseline.alphabetic,
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        children: props['children'] ?? const <Widget>[],
      ),
  'Flexible': (props) =>
      Flexible(
        key: props['key'],
        flex: props['flex'] ?? 1,
        fit: props['fit'] ?? FlexFit.loose,
        child: props['child'],
      ),
  'Flow': (props) =>
      Flow(
        key: props['key'],
        delegate: props['delegate'],
        children: props['children'] ?? const <Widget>[],
      ),
  'Flow.unwrapped': (props) =>
      Flow.unwrapped(
        key: props['key'],
        delegate: props['delegate'],
        children: props['children'] ?? const <Widget>[],
      ),
  'FractionalTranslation': (props) =>
      FractionalTranslation(
        key: props['key'],
        translation: props['translation'],
        transformHitTests: props['transformHitTests'] ?? true,
        child: props['child'],
      ),
  'FractionallySizedBox': (props) =>
      FractionallySizedBox(
        key: props['key'],
        alignment: props['alignment'] ?? Alignment.center,
        widthFactor: props['widthFactor']?.toDouble(),
        heightFactor: props['heightFactor']?.toDouble(),
        child: props['child'],
      ),
  'IgnorePointer': (props) =>
      IgnorePointer(
        key: props['key'],
        ignoring: props['ignoring'] ?? true,
        ignoringSemantics: props['ignoringSemantics'],
        child: props['child'],
      ),
  'IndexedSemantics': (props) =>
      IndexedSemantics(
        key: props['key'],
        index: props['index'],
        child: props['child'],
      ),
  'IndexedStack': (props) =>
      IndexedStack(
        key: props['key'],
        alignment: props['alignment'] ?? AlignmentDirectional.topStart,
        textDirection: props['textDirection'],
        sizing: props['sizing'] ?? StackFit.loose,
        index: props['index'] ?? 0,
        children: props['children'] ?? const <Widget>[],
      ),
  'IntrinsicHeight': (props) =>
      IntrinsicHeight(
        key: props['key'],
        child: props['child'],
      ),
  'IntrinsicWidth': (props) =>
      IntrinsicWidth(
        key: props['key'],
        stepWidth: props['stepWidth']?.toDouble(),
        stepHeight: props['stepHeight']?.toDouble(),
        child: props['child'],
      ),
  'KeyedSubtree': (props) =>
      KeyedSubtree(
        key: props['key'],
        child: props['child'],
      ),
  'KeyedSubtree.wrap': (props) =>
      KeyedSubtree.wrap(
        props['pa'][0],
        props['pa'][1],
      ),
  'LayoutId': (props) =>
      LayoutId(
        key: props['key'],
        id: props['id'],
        child: props['child'],
      ),
  'LimitedBox': (props) =>
      LimitedBox(
        key: props['key'],
        maxWidth: props['maxWidth']?.toDouble() ?? double.infinity,
        maxHeight: props['maxHeight']?.toDouble() ?? double.infinity,
        child: props['child'],
      ),
  'ListBody': (props) =>
      ListBody(
        key: props['key'],
        mainAxis: props['mainAxis'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        children: props['children'] ?? const <Widget>[],
      ),
  'Listener': (props) =>
      Listener(
        key: props['key'],
        onPointerDown: props['onPointerDown'],
        onPointerMove: props['onPointerMove'],
        onPointerEnter: props['onPointerEnter'],
        onPointerExit: props['onPointerExit'],
        onPointerHover: props['onPointerHover'],
        onPointerUp: props['onPointerUp'],
        onPointerCancel: props['onPointerCancel'],
        onPointerSignal: props['onPointerSignal'],
        behavior: props['behavior'] ?? HitTestBehavior.deferToChild,
        child: props['child'],
      ),
  'MergeSemantics': (props) =>
      MergeSemantics(
        key: props['key'],
        child: props['child'],
      ),
  'MetaData': (props) =>
      MetaData(
        key: props['key'],
        metaData: props['metaData'],
        behavior: props['behavior'] ?? HitTestBehavior.deferToChild,
        child: props['child'],
      ),
  'MouseRegion': (props) =>
      MouseRegion(
        key: props['key'],
        onEnter: props['onEnter'],
        onExit: props['onExit'],
        onHover: props['onHover'],
        cursor: props['cursor'] ?? MouseCursor.defer,
        opaque: props['opaque'] ?? true,
        child: props['child'],
      ),
  'Offstage': (props) =>
      Offstage(
        key: props['key'],
        offstage: props['offstage'] ?? true,
        child: props['child'],
      ),
  'Opacity': (props) =>
      Opacity(
        key: props['key'],
        opacity: props['opacity']?.toDouble(),
        alwaysIncludeSemantics: props['alwaysIncludeSemantics'] ?? false,
        child: props['child'],
      ),
  'OverflowBox': (props) =>
      OverflowBox(
        key: props['key'],
        alignment: props['alignment'] ?? Alignment.center,
        minWidth: props['minWidth']?.toDouble(),
        maxWidth: props['maxWidth']?.toDouble(),
        minHeight: props['minHeight']?.toDouble(),
        maxHeight: props['maxHeight']?.toDouble(),
        child: props['child'],
      ),
  'Padding': (props) =>
      Padding(
        key: props['key'],
        padding: props['padding'],
        child: props['child'],
      ),
  'PhysicalModel': (props) =>
      PhysicalModel(
        key: props['key'],
        shape: props['shape'] ?? BoxShape.rectangle,
        clipBehavior: props['clipBehavior'] ?? Clip.none,
        borderRadius: props['borderRadius'],
        elevation: props['elevation']?.toDouble() ?? 0.0,
        color: props['color'],
        shadowColor: props['shadowColor'] ?? const Color(0xFF000000),
        child: props['child'],
      ),
  'PhysicalShape': (props) =>
      PhysicalShape(
        key: props['key'],
        clipper: props['clipper'],
        clipBehavior: props['clipBehavior'] ?? Clip.none,
        elevation: props['elevation']?.toDouble() ?? 0.0,
        color: props['color'],
        shadowColor: props['shadowColor'] ?? const Color(0xFF000000),
        child: props['child'],
      ),
  'Positioned': (props) =>
      Positioned(
        key: props['key'],
        left: props['left']?.toDouble(),
        top: props['top']?.toDouble(),
        right: props['right']?.toDouble(),
        bottom: props['bottom']?.toDouble(),
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        child: props['child'],
      ),
  'Positioned.fromRect': (props) =>
      Positioned.fromRect(
        key: props['key'],
        rect: props['rect'],
        child: props['child'],
      ),
  'Positioned.fromRelativeRect': (props) =>
      Positioned.fromRelativeRect(
        key: props['key'],
        rect: props['rect'],
        child: props['child'],
      ),
  'Positioned.fill': (props) =>
      Positioned.fill(
        key: props['key'],
        left: props['left']?.toDouble() ?? 0.0,
        top: props['top']?.toDouble() ?? 0.0,
        right: props['right']?.toDouble() ?? 0.0,
        bottom: props['bottom']?.toDouble() ?? 0.0,
        child: props['child'],
      ),
  'Positioned.directional': (props) =>
      Positioned.directional(
        key: props['key'],
        textDirection: props['textDirection'],
        start: props['start']?.toDouble(),
        top: props['top']?.toDouble() ?? 0.0,
        end: props['end']?.toDouble(),
        bottom: props['bottom']?.toDouble() ?? 0.0,
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        child: props['child'],
      ),
  'PositionedDirectional': (props) =>
      PositionedDirectional(
        key: props['key'],
        start: props['start']?.toDouble(),
        top: props['top']?.toDouble(),
        end: props['end']?.toDouble(),
        bottom: props['bottom']?.toDouble(),
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        child: props['child'],
      ),
  'RawImage': (props) =>
      RawImage(
        key: props['key'],
        image: props['image'],
        debugImageLabel: props['debugImageLabel'],
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        scale: props['scale']?.toDouble() ?? 1.0,
        color: props['color'],
        colorBlendMode: props['colorBlendMode'],
        fit: props['fit'],
        alignment: props['alignment'] ?? Alignment.center,
        repeat: props['repeat'] ?? ImageRepeat.noRepeat,
        centerSlice: props['centerSlice'],
        matchTextDirection: props['matchTextDirection'] ?? false,
        invertColors: props['invertColors'] ?? false,
        filterQuality: props['filterQuality'] ?? FilterQuality.low,
        isAntiAlias: props['isAntiAlias'] ?? false,
      ),
  'RepaintBoundary': (props) =>
      RepaintBoundary(
        key: props['key'],
        child: props['child'],
      ),
  'RepaintBoundary.wrap': (props) =>
      RepaintBoundary.wrap(
        props['pa'][0],
        props['pa'][1],
      ),
  'RichText': (props) =>
      RichText(
        key: props['key'],
        text: props['text'],
        textAlign: props['textAlign'] ?? TextAlign.start,
        textDirection: props['textDirection'],
        softWrap: props['softWrap'] ?? true,
        overflow: props['overflow'] ?? TextOverflow.clip,
        textScaleFactor: props['textScaleFactor']?.toDouble() ?? 1.0,
        maxLines: props['maxLines'],
        locale: props['locale'],
        strutStyle: props['strutStyle'],
        textWidthBasis: props['textWidthBasis'] ?? TextWidthBasis.parent,
        textHeightBehavior: props['textHeightBehavior'],
      ),
  'RotatedBox': (props) =>
      RotatedBox(
        key: props['key'],
        quarterTurns: props['quarterTurns'],
        child: props['child'],
      ),
  'Row': (props) =>
      Row(
        key: props['key'],
        mainAxisAlignment:
        props['mainAxisAlignment'] ?? MainAxisAlignment.start,
        mainAxisSize: props['mainAxisSize'] ?? MainAxisSize.max,
        crossAxisAlignment:
        props['crossAxisAlignment'] ?? CrossAxisAlignment.center,
        textDirection: props['textDirection'],
        verticalDirection:
        props['verticalDirection'] ?? VerticalDirection.down,
        textBaseline: props['textBaseline'] ?? TextBaseline.alphabetic,
        children: props['children'] ?? const <Widget>[],
      ),
  'Semantics': (props) =>
      Semantics(
        key: props['key'],
        child: props['child'],
        container: props['container'] ?? false,
        explicitChildNodes: props['explicitChildNodes'] ?? false,
        excludeSemantics: props['excludeSemantics'] ?? false,
        enabled: props['enabled'],
        checked: props['checked'],
        selected: props['selected'],
        toggled: props['toggled'],
        button: props['button'],
        link: props['link'],
        header: props['header'],
        textField: props['textField'],
        readOnly: props['readOnly'],
        focusable: props['focusable'],
        focused: props['focused'],
        inMutuallyExclusiveGroup: props['inMutuallyExclusiveGroup'],
        obscured: props['obscured'],
        multiline: props['multiline'],
        scopesRoute: props['scopesRoute'],
        namesRoute: props['namesRoute'],
        hidden: props['hidden'],
        image: props['image'],
        liveRegion: props['liveRegion'],
        maxValueLength: props['maxValueLength'],
        currentValueLength: props['currentValueLength'],
        label: props['label'],
        value: props['value'],
        increasedValue: props['increasedValue'],
        decreasedValue: props['decreasedValue'],
        hint: props['hint'],
        onTapHint: props['onTapHint'],
        onLongPressHint: props['onLongPressHint'],
        textDirection: props['textDirection'],
        sortKey: props['sortKey'],
        onTap: props['onTap'],
        onLongPress: props['onLongPress'],
        onScrollLeft: props['onScrollLeft'],
        onScrollRight: props['onScrollRight'],
        onScrollUp: props['onScrollUp'],
        onScrollDown: props['onScrollDown'],
        onIncrease: props['onIncrease'],
        onDecrease: props['onDecrease'],
        onCopy: props['onCopy'],
        onCut: props['onCut'],
        onPaste: props['onPaste'],
        onDismiss: props['onDismiss'],
        onMoveCursorForwardByCharacter:
        props['onMoveCursorForwardByCharacter'],
        onMoveCursorBackwardByCharacter:
        props['onMoveCursorBackwardByCharacter'],
        onSetSelection: props['onSetSelection'],
        onDidGainAccessibilityFocus: props['onDidGainAccessibilityFocus'],
        onDidLoseAccessibilityFocus: props['onDidLoseAccessibilityFocus'],
        customSemanticsActions: props['customSemanticsActions'],
      ),
  'Semantics.fromProperties': (props) =>
      Semantics.fromProperties(
        key: props['key'],
        child: props['child'],
        container: props['container'] ?? false,
        explicitChildNodes: props['explicitChildNodes'] ?? false,
        excludeSemantics: props['excludeSemantics'] ?? false,
        properties: props['properties'],
      ),
  'ShaderMask': (props) =>
      ShaderMask(
        key: props['key'],
        shaderCallback: props['shaderCallback'],
        blendMode: props['blendMode'] ?? BlendMode.modulate,
        child: props['child'],
      ),
  'SizedBox': (props) =>
      SizedBox(
        key: props['key'],
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        child: props['child'],
      ),
  'SizedBox.expand': (props) =>
      SizedBox.expand(
        key: props['key'],
        child: props['child'],
      ),
  'SizedBox.shrink': (props) =>
      SizedBox.shrink(
        key: props['key'],
        child: props['child'],
      ),
  'SizedBox.fromSize': (props) =>
      SizedBox.fromSize(
        key: props['key'],
        child: props['child'],
        size: props['size'],
      ),
  'SizedOverflowBox': (props) =>
      SizedOverflowBox(
        key: props['key'],
        size: props['size'],
        alignment: props['alignment'] ?? Alignment.center,
        child: props['child'],
      ),
  'SliverPadding': (props) =>
      SliverPadding(
        key: props['key'],
        padding: props['padding'],
        sliver: props['sliver'],
      ),
  'SliverToBoxAdapter': (props) =>
      SliverToBoxAdapter(
        key: props['key'],
        child: props['child'],
      ),
  'Stack': (props) =>
      Stack(
        key: props['key'],
        alignment: props['alignment'] ?? AlignmentDirectional.topStart,
        textDirection: props['textDirection'],
        fit: props['fit'] ?? StackFit.loose,
        overflow: props['overflow'] ?? Overflow.clip,
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        children: props['children'] ?? const <Widget>[],
      ),
  'StatefulBuilder': (props) =>
      StatefulBuilder(
        key: props['key'],
        builder: props['builder'],
      ),
  'Transform': (props) =>
      Transform(
        key: props['key'],
        transform: props['transform'],
        origin: props['origin'],
        alignment: props['alignment'],
        transformHitTests: props['transformHitTests'] ?? true,
        child: props['child'],
      ),
  'Transform.rotate': (props) =>
      Transform.rotate(
        key: props['key'],
        angle: props['angle']?.toDouble(),
        origin: props['origin'],
        alignment: props['alignment'] ?? Alignment.center,
        transformHitTests: props['transformHitTests'] ?? true,
        child: props['child'],
      ),
  'Transform.translate': (props) =>
      Transform.translate(
        key: props['key'],
        offset: props['offset'],
        transformHitTests: props['transformHitTests'] ?? true,
        child: props['child'],
      ),
  'Transform.scale': (props) =>
      Transform.scale(
        key: props['key'],
        scale: props['scale']?.toDouble(),
        origin: props['origin'],
        alignment: props['alignment'] ?? Alignment.center,
        transformHitTests: props['transformHitTests'] ?? true,
        child: props['child'],
      ),
  'UnconstrainedBox': (props) =>
      UnconstrainedBox(
        key: props['key'],
        child: props['child'],
        textDirection: props['textDirection'],
        alignment: props['alignment'] ?? Alignment.center,
        constrainedAxis: props['constrainedAxis'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'WidgetToRenderBoxAdapter': (props) =>
      WidgetToRenderBoxAdapter(
        renderBox: props['renderBox'],
        onBuild: props['onBuild'],
      ),
  'Wrap': (props) =>
      Wrap(
        key: props['key'],
        direction: props['direction'] ?? Axis.horizontal,
        alignment: props['alignment'] ?? WrapAlignment.start,
        spacing: props['spacing']?.toDouble() ?? 0.0,
        runAlignment: props['runAlignment'] ?? WrapAlignment.start,
        runSpacing: props['runSpacing']?.toDouble() ?? 0.0,
        crossAxisAlignment:
        props['crossAxisAlignment'] ?? WrapCrossAlignment.start,
        textDirection: props['textDirection'],
        verticalDirection:
        props['verticalDirection'] ?? VerticalDirection.down,
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        children: props['children'] ?? const <Widget>[],
      ),
  'ActionListener': (props) =>
      ActionListener(
        key: props['key'],
        listener: props['listener'],
        action: props['action'],
        child: props['child'],
      ),
  'Actions': (props) =>
      Actions(
        key: props['key'],
        dispatcher: props['dispatcher'],
        actions: props['actions'],
        child: props['child'],
      ),
  'FocusableActionDetector': (props) =>
      FocusableActionDetector(
        key: props['key'],
        enabled: props['enabled'] ?? true,
        focusNode: props['focusNode'],
        autofocus: props['autofocus'] ?? false,
        shortcuts: props['shortcuts'],
        actions: props['actions'],
        onShowFocusHighlight: props['onShowFocusHighlight'],
        onShowHoverHighlight: props['onShowHoverHighlight'],
        onFocusChange: props['onFocusChange'],
        mouseCursor: props['mouseCursor'] ?? MouseCursor.defer,
        child: props['child'],
      ),
  'Intent': {
    'doNothing': Intent.doNothing,
  },
  'AlignTransition': (props) =>
      AlignTransition(
        key: props['key'],
        alignment: props['alignment'],
        child: props['child'],
        widthFactor: props['widthFactor']?.toDouble(),
        heightFactor: props['heightFactor']?.toDouble(),
      ),
  'AnimatedBuilder': (props) =>
      AnimatedBuilder(
        key: props['key'],
        animation: props['animation'],
        builder: props['builder'],
        child: props['child'],
      ),
  'DecoratedBoxTransition': (props) =>
      DecoratedBoxTransition(
        key: props['key'],
        decoration: props['decoration'],
        position: props['position'] ?? DecorationPosition.background,
        child: props['child'],
      ),
  'DefaultTextStyleTransition': (props) =>
      DefaultTextStyleTransition(
        key: props['key'],
        style: props['style'],
        child: props['child'],
        textAlign: props['textAlign'],
        softWrap: props['softWrap'] ?? true,
        overflow: props['overflow'] ?? TextOverflow.clip,
        maxLines: props['maxLines'],
      ),
  'FadeTransition': (props) =>
      FadeTransition(
        key: props['key'],
        opacity: props['opacity'],
        alwaysIncludeSemantics: props['alwaysIncludeSemantics'] ?? false,
        child: props['child'],
      ),
  'PositionedTransition': (props) =>
      PositionedTransition(
        key: props['key'],
        rect: props['rect'],
        child: props['child'],
      ),
  'RelativePositionedTransition': (props) =>
      RelativePositionedTransition(
        key: props['key'],
        rect: props['rect'],
        size: props['size'],
        child: props['child'],
      ),
  'RotationTransition': (props) =>
      RotationTransition(
        key: props['key'],
        turns: props['turns'],
        alignment: props['alignment'] ?? Alignment.center,
        child: props['child'],
      ),
  'ScaleTransition': (props) =>
      ScaleTransition(
        key: props['key'],
        scale: props['scale'],
        alignment: props['alignment'] ?? Alignment.center,
        child: props['child'],
      ),
  'SizeTransition': (props) =>
      SizeTransition(
        key: props['key'],
        axis: props['axis'] ?? Axis.vertical,
        sizeFactor: props['sizeFactor'],
        axisAlignment: props['axisAlignment']?.toDouble() ?? 0.0,
        child: props['child'],
      ),
  'SlideTransition': (props) =>
      SlideTransition(
        key: props['key'],
        position: props['position'],
        transformHitTests: props['transformHitTests'] ?? true,
        textDirection: props['textDirection'],
        child: props['child'],
      ),
  'SliverFadeTransition': (props) =>
      SliverFadeTransition(
        key: props['key'],
        opacity: props['opacity'],
        alwaysIncludeSemantics: props['alwaysIncludeSemantics'] ?? false,
        sliver: props['sliver'],
      ),
  'AndroidView': (props) =>
      AndroidView(
        key: props['key'],
        viewType: props['viewType'],
        onPlatformViewCreated: props['onPlatformViewCreated'],
        hitTestBehavior:
        props['hitTestBehavior'] ?? PlatformViewHitTestBehavior.opaque,
        layoutDirection: props['layoutDirection'],
        gestureRecognizers: props['gestureRecognizers'],
        creationParams: props['creationParams'],
        creationParamsCodec: props['creationParamsCodec'],
      ),
  'AndroidViewSurface': (props) =>
      AndroidViewSurface(
        key: props['key'],
        controller: props['controller'],
        hitTestBehavior: props['hitTestBehavior'],
        gestureRecognizers: props['gestureRecognizers'],
      ),
  'HtmlElementView': (props) =>
      HtmlElementView(
        key: props['key'],
        viewType: props['viewType'],
      ),
  'PlatformViewLink': (props) =>
      PlatformViewLink(
        key: props['key'],
        surfaceFactory: props['surfaceFactory'],
        onCreatePlatformView: props['onCreatePlatformView'],
        viewType: props['viewType'],
      ),
  'PlatformViewSurface': (props) =>
      PlatformViewSurface(
        key: props['key'],
        controller: props['controller'],
        hitTestBehavior: props['hitTestBehavior'],
        gestureRecognizers: props['gestureRecognizers'],
      ),
  'UiKitView': (props) =>
      UiKitView(
        key: props['key'],
        viewType: props['viewType'],
        onPlatformViewCreated: props['onPlatformViewCreated'],
        hitTestBehavior:
        props['hitTestBehavior'] ?? PlatformViewHitTestBehavior.opaque,
        layoutDirection: props['layoutDirection'],
        creationParams: props['creationParams'],
        creationParamsCodec: props['creationParamsCodec'],
        gestureRecognizers: props['gestureRecognizers'],
      ),
  'AnimatedAlign': (props) =>
      AnimatedAlign(
        key: props['key'],
        alignment: props['alignment'],
        child: props['child'],
        heightFactor: props['heightFactor']?.toDouble(),
        widthFactor: props['widthFactor']?.toDouble(),
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        onEnd: props['onEnd'],
      ),
  'AnimatedContainer': (props) =>
      AnimatedContainer(
        key: props['key'],
        alignment: props['alignment'],
        padding: props['padding'],
        color: props['color'],
        decoration: props['decoration'],
        foregroundDecoration: props['foregroundDecoration'],
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        constraints: props['constraints'],
        margin: props['margin'],
        transform: props['transform'],
        child: props['child'],
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        onEnd: props['onEnd'],
      ),
  'AnimatedDefaultTextStyle': (props) =>
      AnimatedDefaultTextStyle(
        key: props['key'],
        child: props['child'],
        style: props['style'],
        textAlign: props['textAlign'],
        softWrap: props['softWrap'] ?? true,
        overflow: props['overflow'] ?? TextOverflow.clip,
        maxLines: props['maxLines'],
        textWidthBasis: props['textWidthBasis'] ?? TextWidthBasis.parent,
        textHeightBehavior: props['textHeightBehavior'],
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        onEnd: props['onEnd'],
      ),
  'AnimatedOpacity': (props) =>
      AnimatedOpacity(
        key: props['key'],
        child: props['child'],
        opacity: props['opacity']?.toDouble(),
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        onEnd: props['onEnd'],
        alwaysIncludeSemantics: props['alwaysIncludeSemantics'] ?? false,
      ),
  'AnimatedPadding': (props) =>
      AnimatedPadding(
        key: props['key'],
        padding: props['padding'],
        child: props['child'],
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        onEnd: props['onEnd'],
      ),
  'AnimatedPhysicalModel': (props) =>
      AnimatedPhysicalModel(
        key: props['key'],
        child: props['child'],
        shape: props['shape'],
        clipBehavior: props['clipBehavior'] ?? Clip.none,
        borderRadius: props['borderRadius'] ?? BorderRadius.zero,
        elevation: props['elevation']?.toDouble(),
        color: props['color'],
        animateColor: props['animateColor'] ?? true,
        shadowColor: props['shadowColor'],
        animateShadowColor: props['animateShadowColor'] ?? true,
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        onEnd: props['onEnd'],
      ),
  'AnimatedPositioned': (props) =>
      AnimatedPositioned(
        key: props['key'],
        child: props['child'],
        left: props['left']?.toDouble(),
        top: props['top']?.toDouble(),
        right: props['right']?.toDouble(),
        bottom: props['bottom']?.toDouble(),
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        onEnd: props['onEnd'],
      ),
  'AnimatedPositioned.fromRect': (props) =>
      AnimatedPositioned.fromRect(
        key: props['key'],
        child: props['child'],
        rect: props['rect'],
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        onEnd: props['onEnd'],
      ),
  'AnimatedPositionedDirectional': (props) =>
      AnimatedPositionedDirectional(
        key: props['key'],
        child: props['child'],
        start: props['start']?.toDouble(),
        top: props['top']?.toDouble(),
        end: props['end']?.toDouble(),
        bottom: props['bottom']?.toDouble(),
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        onEnd: props['onEnd'],
      ),
  'SliverAnimatedOpacity': (props) =>
      SliverAnimatedOpacity(
        key: props['key'],
        sliver: props['sliver'],
        opacity: props['opacity']?.toDouble(),
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        onEnd: props['onEnd'],
        alwaysIncludeSemantics: props['alwaysIncludeSemantics'] ?? false,
      ),
  'AnimatedCrossFade': (props) =>
      AnimatedCrossFade(
        key: props['key'],
        firstChild: props['firstChild'],
        secondChild: props['secondChild'],
        firstCurve: props['firstCurve'] ?? Curves.linear,
        secondCurve: props['secondCurve'] ?? Curves.linear,
        sizeCurve: props['sizeCurve'] ?? Curves.linear,
        alignment: props['alignment'] ?? Alignment.topCenter,
        crossFadeState: props['crossFadeState'],
        duration: props['duration'],
        reverseDuration: props['reverseDuration'],
      ),
  'CrossFadeState': {
    'values': CrossFadeState.values,
    'showFirst': CrossFadeState.showFirst,
    'showSecond': CrossFadeState.showSecond,
  },
  'AnimatedList': (props) =>
      AnimatedList(
        key: props['key'],
        itemBuilder: props['itemBuilder'],
        initialItemCount: props['initialItemCount'] ?? 0,
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        padding: props['padding'],
      ),
  'AnimatedListState': (props) => AnimatedListState(),
  'SliverAnimatedList': (props) =>
      SliverAnimatedList(
        key: props['key'],
        itemBuilder: props['itemBuilder'],
        initialItemCount: props['initialItemCount'] ?? 0,
      ),
  'AnimatedModalBarrier': (props) =>
      AnimatedModalBarrier(
        key: props['key'],
        color: props['color'],
        dismissible: props['dismissible'] ?? true,
        semanticsLabel: props['semanticsLabel'],
        barrierSemanticsDismissible: props['barrierSemanticsDismissible'],
      ),
  'ModalBarrier': (props) =>
      ModalBarrier(
        key: props['key'],
        color: props['color'],
        dismissible: props['dismissible'] ?? true,
        semanticsLabel: props['semanticsLabel'],
        barrierSemanticsDismissible:
        props['barrierSemanticsDismissible'] ?? true,
      ),
  'AnimatedSize': (props) =>
      AnimatedSize(
        key: props['key'],
        child: props['child'],
        alignment: props['alignment'] ?? Alignment.center,
        curve: props['curve'] ?? Curves.linear,
        duration: props['duration'],
        reverseDuration: props['reverseDuration'],
        vsync: props['vsync'],
      ),
  'AnimatedSwitcher': (props) =>
      AnimatedSwitcher(
        key: props['key'],
        child: props['child'],
        duration: props['duration'],
        reverseDuration: props['reverseDuration'],
        switchInCurve: props['switchInCurve'] ?? Curves.linear,
        switchOutCurve: props['switchOutCurve'] ?? Curves.linear,
        transitionBuilder: props['transitionBuilder'] ??
            AnimatedSwitcher.defaultTransitionBuilder,
      ),
  'AnnotatedRegion': (props) =>
      AnnotatedRegion(
        key: props['key'],
        child: props['child'],
        value: props['value'],
        sized: props['sized'] ?? true,
      ),
  'AutofillContextAction': {
    'values': AutofillContextAction.values,
    'commit': AutofillContextAction.commit,
    'cancel': AutofillContextAction.cancel,
  },
  'AutofillGroup': (props) =>
      AutofillGroup(
        key: props['key'],
        child: props['child'],
        onDisposeAction:
        props['onDisposeAction'] ?? AutofillContextAction.commit,
      ),
  'AutomaticKeepAlive': (props) =>
      AutomaticKeepAlive(
        key: props['key'],
        child: props['child'],
      ),
  'AutovalidateMode': {
    'values': AutovalidateMode.values,
    'disabled': AutovalidateMode.disabled,
    'always': AutovalidateMode.always,
    'onUserInteraction': AutovalidateMode.onUserInteraction,
  },
  'Form': (props) =>
      Form(
        key: props['key'],
        child: props['child'],
        autovalidate: props['autovalidate'] ?? false,
        onWillPop: props['onWillPop'],
        onChanged: props['onChanged'],
        autovalidateMode: props['autovalidateMode'],
      ),
  'FormField': (props) =>
      FormField(
        key: props['key'],
        builder: props['builder'],
        onSaved: props['onSaved'],
        validator: props['validator'],
        initialValue: props['initialValue'],
        autovalidate: props['autovalidate'] ?? false,
        enabled: props['enabled'] ?? true,
        autovalidateMode: props['autovalidateMode'],
      ),
  'Banner': (props) =>
      Banner(
        key: props['key'],
        child: props['child'],
        message: props['message'],
        textDirection: props['textDirection'],
        location: props['location'],
        layoutDirection: props['layoutDirection'],
        color: props['color'] ?? _kColor,
        textStyle: props['textStyle'] ?? _kTextStyle,
      ),
  'BannerLocation': {
    'values': BannerLocation.values,
    'topStart': BannerLocation.topStart,
    'topEnd': BannerLocation.topEnd,
    'bottomStart': BannerLocation.bottomStart,
    'bottomEnd': BannerLocation.bottomEnd,
  },
  'CheckedModeBanner': (props) =>
      CheckedModeBanner(
        key: props['key'],
        child: props['child'],
      ),
  'BouncingScrollSimulation': {
    'maxSpringTransferVelocity':
    BouncingScrollSimulation.maxSpringTransferVelocity,
  },
  'ClipboardStatus': {
    'values': ClipboardStatus.values,
    'pasteable': ClipboardStatus.pasteable,
    'unknown': ClipboardStatus.unknown,
    'notPasteable': ClipboardStatus.notPasteable,
  },
  'TextSelectionGestureDetector': (props) =>
      TextSelectionGestureDetector(
        key: props['key'],
        onTapDown: props['onTapDown'],
        onForcePressStart: props['onForcePressStart'],
        onForcePressEnd: props['onForcePressEnd'],
        onSingleTapUp: props['onSingleTapUp'],
        onSingleTapCancel: props['onSingleTapCancel'],
        onSingleLongTapStart: props['onSingleLongTapStart'],
        onSingleLongTapMoveUpdate: props['onSingleLongTapMoveUpdate'],
        onSingleLongTapEnd: props['onSingleLongTapEnd'],
        onDoubleTapDown: props['onDoubleTapDown'],
        onDragSelectionStart: props['onDragSelectionStart'],
        onDragSelectionUpdate: props['onDragSelectionUpdate'],
        onDragSelectionEnd: props['onDragSelectionEnd'],
        behavior: props['behavior'],
        child: props['child'],
      ),
  'TextSelectionHandleType': {
    'values': TextSelectionHandleType.values,
    'left': TextSelectionHandleType.left,
    'right': TextSelectionHandleType.right,
    'collapsed': TextSelectionHandleType.collapsed,
  },
  'TextSelectionOverlay': {
    'fadeDuration': TextSelectionOverlay.fadeDuration,
  },
  'ColorFiltered': (props) =>
      ColorFiltered(
        colorFilter: props['colorFilter'],
        child: props['child'],
        key: props['key'],
      ),
  'ConnectionState': {
    'values': ConnectionState.values,
    'none': ConnectionState.none,
    'waiting': ConnectionState.waiting,
    'active': ConnectionState.active,
    'done': ConnectionState.done,
  },
  'FutureBuilder': (props) =>
      FutureBuilder(
        key: props['key'],
        future: props['future'],
        initialData: props['initialData'],
        builder: props['builder'],
      ),
  'StreamBuilder': (props) =>
      StreamBuilder(
        key: props['key'],
        initialData: props['initialData'],
        stream: props['stream'],
        builder: props['builder'],
      ),
  'Container': (props) =>
      Container(
        key: props['key'],
        alignment: props['alignment'],
        padding: props['padding'],
        color: props['color'],
        decoration: props['decoration'],
        foregroundDecoration: props['foregroundDecoration'],
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        constraints: props['constraints'],
        margin: props['margin'],
        transform: props['transform'],
        child: props['child'],
        clipBehavior: props['clipBehavior'] ?? Clip.none,
      ),
  'DecoratedBox': (props) =>
      DecoratedBox(
        key: props['key'],
        decoration: props['decoration'],
        position: props['position'] ?? DecorationPosition.background,
        child: props['child'],
      ),
  'CustomScrollView': (props) =>
      CustomScrollView(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        center: props['center'],
        anchor: props['anchor']?.toDouble() ?? 0.0,
        cacheExtent: props['cacheExtent']?.toDouble(),
        slivers: props['slivers'] ?? const <Widget>[],
        semanticChildCount: props['semanticChildCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'GridView': (props) =>
      GridView(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        padding: props['padding'],
        gridDelegate: props['gridDelegate'],
        addAutomaticKeepAlives: props['addAutomaticKeepAlives'] ?? true,
        addRepaintBoundaries: props['addRepaintBoundaries'] ?? true,
        addSemanticIndexes: props['addSemanticIndexes'] ?? true,
        cacheExtent: props['cacheExtent']?.toDouble(),
        children: props['children'] ?? const <Widget>[],
        semanticChildCount: props['semanticChildCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        keyboardDismissBehavior: props['keyboardDismissBehavior'] ??
            ScrollViewKeyboardDismissBehavior.manual,
        restorationId: props['restorationId'],
      ),
  'GridView.builder': (props) =>
      GridView.builder(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        padding: props['padding'],
        gridDelegate: props['gridDelegate'],
        itemBuilder: props['itemBuilder'],
        itemCount: props['itemCount'],
        addAutomaticKeepAlives: props['addAutomaticKeepAlives'] ?? true,
        addRepaintBoundaries: props['addRepaintBoundaries'] ?? true,
        addSemanticIndexes: props['addSemanticIndexes'] ?? true,
        cacheExtent: props['cacheExtent']?.toDouble(),
        semanticChildCount: props['semanticChildCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        keyboardDismissBehavior: props['keyboardDismissBehavior'] ??
            ScrollViewKeyboardDismissBehavior.manual,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'GridView.custom': (props) =>
      GridView.custom(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        padding: props['padding'],
        gridDelegate: props['gridDelegate'],
        childrenDelegate: props['childrenDelegate'],
        cacheExtent: props['cacheExtent']?.toDouble(),
        semanticChildCount: props['semanticChildCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        keyboardDismissBehavior: props['keyboardDismissBehavior'] ??
            ScrollViewKeyboardDismissBehavior.manual,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'GridView.count': (props) =>
      GridView.count(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        padding: props['padding'],
        crossAxisCount: props['crossAxisCount'],
        mainAxisSpacing: props['mainAxisSpacing']?.toDouble() ?? 0.0,
        crossAxisSpacing: props['crossAxisSpacing']?.toDouble() ?? 0.0,
        childAspectRatio: props['childAspectRatio']?.toDouble() ?? 1.0,
        addAutomaticKeepAlives: props['addAutomaticKeepAlives'] ?? true,
        addRepaintBoundaries: props['addRepaintBoundaries'] ?? true,
        addSemanticIndexes: props['addSemanticIndexes'] ?? true,
        cacheExtent: props['cacheExtent']?.toDouble(),
        children: props['children'] ?? const <Widget>[],
        semanticChildCount: props['semanticChildCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        keyboardDismissBehavior: props['keyboardDismissBehavior'] ??
            ScrollViewKeyboardDismissBehavior.manual,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'GridView.extent': (props) =>
      GridView.extent(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        padding: props['padding'],
        maxCrossAxisExtent: props['maxCrossAxisExtent']?.toDouble(),
        mainAxisSpacing: props['mainAxisSpacing']?.toDouble() ?? 0.0,
        crossAxisSpacing: props['crossAxisSpacing']?.toDouble() ?? 0.0,
        childAspectRatio: props['childAspectRatio']?.toDouble() ?? 1.0,
        addAutomaticKeepAlives: props['addAutomaticKeepAlives'] ?? true,
        addRepaintBoundaries: props['addRepaintBoundaries'] ?? true,
        addSemanticIndexes: props['addSemanticIndexes'] ?? true,
        cacheExtent: props['cacheExtent']?.toDouble(),
        children: props['children'] ?? const <Widget>[],
        semanticChildCount: props['semanticChildCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        keyboardDismissBehavior: props['keyboardDismissBehavior'] ??
            ScrollViewKeyboardDismissBehavior.manual,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'ListView': (props) =>
      ListView(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        padding: props['padding'],
        itemExtent: props['itemExtent']?.toDouble(),
        addAutomaticKeepAlives: props['addAutomaticKeepAlives'] ?? true,
        addRepaintBoundaries: props['addRepaintBoundaries'] ?? true,
        addSemanticIndexes: props['addSemanticIndexes'] ?? true,
        cacheExtent: props['cacheExtent']?.toDouble(),
        children: props['children'] ?? const <Widget>[],
        semanticChildCount: props['semanticChildCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        keyboardDismissBehavior: props['keyboardDismissBehavior'] ??
            ScrollViewKeyboardDismissBehavior.manual,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'ListView.builder': (props) =>
      ListView.builder(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        padding: props['padding'],
        itemExtent: props['itemExtent']?.toDouble(),
        itemBuilder: props['itemBuilder'],
        itemCount: (props['itemCount'] is num) ? props['itemCount'] : num.parse(
            props['itemCount']),
        addAutomaticKeepAlives: props['addAutomaticKeepAlives'] ?? true,
        addRepaintBoundaries: props['addRepaintBoundaries'] ?? true,
        addSemanticIndexes: props['addSemanticIndexes'] ?? true,
        cacheExtent: props['cacheExtent']?.toDouble(),
        semanticChildCount: props['semanticChildCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        keyboardDismissBehavior: props['keyboardDismissBehavior'] ??
            ScrollViewKeyboardDismissBehavior.manual,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'ListView.separated': (props) =>
      ListView.separated(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        padding: props['padding'],
        itemBuilder: props['itemBuilder'],
        separatorBuilder: props['separatorBuilder'],
        itemCount: props['itemCount'],
        addAutomaticKeepAlives: props['addAutomaticKeepAlives'] ?? true,
        addRepaintBoundaries: props['addRepaintBoundaries'] ?? true,
        addSemanticIndexes: props['addSemanticIndexes'] ?? true,
        cacheExtent: props['cacheExtent']?.toDouble(),
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        keyboardDismissBehavior: props['keyboardDismissBehavior'] ??
            ScrollViewKeyboardDismissBehavior.manual,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'ListView.custom': (props) =>
      ListView.custom(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        primary: props['primary'],
        physics: props['physics'],
        shrinkWrap: props['shrinkWrap'] ?? false,
        padding: props['padding'],
        itemExtent: props['itemExtent']?.toDouble(),
        childrenDelegate: props['childrenDelegate'],
        cacheExtent: props['cacheExtent']?.toDouble(),
        semanticChildCount: props['semanticChildCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        keyboardDismissBehavior: props['keyboardDismissBehavior'] ??
            ScrollViewKeyboardDismissBehavior.manual,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'ScrollViewKeyboardDismissBehavior': {
    'values': ScrollViewKeyboardDismissBehavior.values,
    'manual': ScrollViewKeyboardDismissBehavior.manual,
    'onDrag': ScrollViewKeyboardDismissBehavior.onDrag,
  },
  'DefaultTextHeightBehavior': (props) =>
      DefaultTextHeightBehavior(
        key: props['key'],
        textHeightBehavior: props['textHeightBehavior'],
        child: props['child'],
      ),
  'DefaultTextStyle': (props) =>
      DefaultTextStyle(
        key: props['key'],
        style: props['style'],
        textAlign: props['textAlign'],
        softWrap: props['softWrap'] ?? true,
        overflow: props['overflow'] ?? TextOverflow.clip,
        maxLines: props['maxLines'],
        textWidthBasis: props['textWidthBasis'] ?? TextWidthBasis.parent,
        textHeightBehavior: props['textHeightBehavior'],
        child: props['child'],
      ),
  'DefaultTextStyle.fallback': (props) =>
      DefaultTextStyle.fallback(
        key: props['key'],
      ),
  'Text': (props) =>
      Text(
        props['pa'][0],
        key: props['key'],
        style: props['style'],
        strutStyle: props['strutStyle'],
        textAlign: props['textAlign'],
        textDirection: props['textDirection'],
        locale: props['locale'],
        softWrap: props['softWrap'],
        overflow: props['overflow'],
        textScaleFactor: props['textScaleFactor']?.toDouble(),
        maxLines: props['maxLines'],
        semanticsLabel: props['semanticsLabel'],
        textWidthBasis: props['textWidthBasis'],
        textHeightBehavior: props['textHeightBehavior'],
      ),
  'Text.rich': (props) =>
      Text.rich(
        props['pa'][0],
        key: props['key'],
        style: props['style'],
        strutStyle: props['strutStyle'],
        textAlign: props['textAlign'],
        textDirection: props['textDirection'],
        locale: props['locale'],
        softWrap: props['softWrap'],
        overflow: props['overflow'],
        textScaleFactor: props['textScaleFactor']?.toDouble(),
        maxLines: props['maxLines'],
        semanticsLabel: props['semanticsLabel'],
        textWidthBasis: props['textWidthBasis'],
        textHeightBehavior: props['textHeightBehavior'],
      ),
  'DefaultWidgetsLocalizations': {
    'delegate': DefaultWidgetsLocalizations.delegate,
  },
  'Localizations': (props) =>
      Localizations(
        key: props['key'],
        locale: props['locale'],
        delegates: as<LocalizationsDelegate>(props['delegates']),
        child: props['child'],
      ),
  'Localizations.override': (props) =>
      Localizations.override(
        key: props['key'],
        context: props['context'],
        locale: props['locale'],
        delegates: as<LocalizationsDelegate>(props['delegates']),
        child: props['child'],
      ),
  'DismissDirection': {
    'values': DismissDirection.values,
    'vertical': DismissDirection.vertical,
    'horizontal': DismissDirection.horizontal,
    'endToStart': DismissDirection.endToStart,
    'startToEnd': DismissDirection.startToEnd,
    'up': DismissDirection.up,
    'down': DismissDirection.down,
  },
  'Dismissible': (props) =>
      Dismissible(
        key: props['key'],
        child: props['child'],
        background: props['background'],
        secondaryBackground: props['secondaryBackground'],
        confirmDismiss: props['confirmDismiss'],
        onResize: props['onResize'],
        onDismissed: props['onDismissed'],
        direction: props['direction'] ?? DismissDirection.horizontal,
        resizeDuration:
        props['resizeDuration'] ?? const Duration(milliseconds: 300),
        dismissThresholds: props['dismissThresholds'] ??
            const <DismissDirection, double>{},
        movementDuration:
        props['movementDuration'] ?? const Duration(milliseconds: 200),
        crossAxisEndOffset: props['crossAxisEndOffset']?.toDouble() ?? 0.0,
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
      ),
  'DragAnchor': {
    'values': DragAnchor.values,
    'child': DragAnchor.child,
    'pointer': DragAnchor.pointer,
  },
  'DragTarget': (props) =>
      DragTarget(
        key: props['key'],
        builder: props['builder'],
        onWillAccept: props['onWillAccept'],
        onAccept: props['onAccept'],
        onAcceptWithDetails: props['onAcceptWithDetails'],
        onLeave: props['onLeave'],
        onMove: props['onMove'],
      ),
  'Draggable': (props) =>
      Draggable(
        key: props['key'],
        child: props['child'],
        feedback: props['feedback'],
        data: props['data'],
        axis: props['axis'],
        childWhenDragging: props['childWhenDragging'],
        feedbackOffset: props['feedbackOffset'] ?? Offset.zero,
        dragAnchor: props['dragAnchor'] ?? DragAnchor.child,
        affinity: props['affinity'],
        maxSimultaneousDrags: props['maxSimultaneousDrags'],
        onDragStarted: props['onDragStarted'],
        onDraggableCanceled: props['onDraggableCanceled'],
        onDragEnd: props['onDragEnd'],
        onDragCompleted: props['onDragCompleted'],
        ignoringFeedbackSemantics:
        props['ignoringFeedbackSemantics'] ?? true,
      ),
  'LongPressDraggable': (props) =>
      LongPressDraggable(
        key: props['key'],
        child: props['child'],
        feedback: props['feedback'],
        data: props['data'],
        axis: props['axis'],
        childWhenDragging: props['childWhenDragging'],
        feedbackOffset: props['feedbackOffset'] ?? Offset.zero,
        dragAnchor: props['dragAnchor'] ?? DragAnchor.child,
        maxSimultaneousDrags: props['maxSimultaneousDrags'],
        onDragStarted: props['onDragStarted'],
        onDraggableCanceled: props['onDraggableCanceled'],
        onDragEnd: props['onDragEnd'],
        onDragCompleted: props['onDragCompleted'],
        hapticFeedbackOnStart: props['hapticFeedbackOnStart'] ?? true,
        ignoringFeedbackSemantics:
        props['ignoringFeedbackSemantics'] ?? true,
      ),
  'DraggableScrollableActuator': (props) =>
      DraggableScrollableActuator(
        key: props['key'],
        child: props['child'],
      ),
  'DraggableScrollableSheet': (props) =>
      DraggableScrollableSheet(
        key: props['key'],
        initialChildSize: props['initialChildSize']?.toDouble() ?? 0.5,
        minChildSize: props['minChildSize']?.toDouble() ?? 0.25,
        maxChildSize: props['maxChildSize']?.toDouble() ?? 1.0,
        expand: props['expand'] ?? true,
        builder: props['builder'],
      ),
  'DualTransitionBuilder': (props) =>
      DualTransitionBuilder(
        key: props['key'],
        animation: props['animation'],
        forwardBuilder: props['forwardBuilder'],
        reverseBuilder: props['reverseBuilder'],
        child: props['child'],
      ),
  'EditableText': (props) =>
      EditableText(
        key: props['key'],
        controller: props['controller'],
        focusNode: props['focusNode'],
        readOnly: props['readOnly'] ?? false,
        obscuringCharacter: props['obscuringCharacter'] ?? '•',
        obscureText: props['obscureText'] ?? false,
        autocorrect: props['autocorrect'] ?? true,
        smartDashesType: props['smartDashesType'],
        smartQuotesType: props['smartQuotesType'],
        enableSuggestions: props['enableSuggestions'] ?? true,
        style: props['style'],
        strutStyle: props['strutStyle'],
        cursorColor: props['cursorColor'],
        backgroundCursorColor: props['backgroundCursorColor'],
        textAlign: props['textAlign'] ?? TextAlign.start,
        textDirection: props['textDirection'],
        locale: props['locale'],
        textScaleFactor: props['textScaleFactor']?.toDouble(),
        maxLines: props['maxLines'] ?? 1,
        minLines: props['minLines'],
        expands: props['expands'] ?? false,
        forceLine: props['forceLine'] ?? true,
        textHeightBehavior: props['textHeightBehavior'],
        textWidthBasis: props['textWidthBasis'] ?? TextWidthBasis.parent,
        autofocus: props['autofocus'] ?? false,
        showCursor: props['showCursor'],
        showSelectionHandles: props['showSelectionHandles'] ?? false,
        selectionColor: props['selectionColor'],
        selectionControls: props['selectionControls'],
        keyboardType: props['keyboardType'],
        textInputAction: props['textInputAction'],
        textCapitalization:
        props['textCapitalization'] ?? TextCapitalization.none,
        onChanged: props['onChanged'],
        onEditingComplete: props['onEditingComplete'],
        onSubmitted: props['onSubmitted'],
        onAppPrivateCommand: props['onAppPrivateCommand'],
        onSelectionChanged: props['onSelectionChanged'],
        onSelectionHandleTapped: props['onSelectionHandleTapped'],
        inputFormatters: as<TextInputFormatter>(props['inputFormatters']),
        mouseCursor: props['mouseCursor'],
        rendererIgnoresPointer: props['rendererIgnoresPointer'] ?? false,
        cursorWidth: props['cursorWidth']?.toDouble() ?? 2.0,
        cursorHeight: props['cursorHeight']?.toDouble(),
        cursorRadius: props['cursorRadius'],
        cursorOpacityAnimates: props['cursorOpacityAnimates'] ?? false,
        cursorOffset: props['cursorOffset'],
        paintCursorAboveText: props['paintCursorAboveText'] ?? false,
        selectionHeightStyle:
        props['selectionHeightStyle'] ?? ui.BoxHeightStyle.tight,
        selectionWidthStyle:
        props['selectionWidthStyle'] ?? ui.BoxWidthStyle.tight,
        scrollPadding: props['scrollPadding'] ?? const EdgeInsets.all(20.0),
        keyboardAppearance: props['keyboardAppearance'] ?? Brightness.light,
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        enableInteractiveSelection:
        props['enableInteractiveSelection'] ?? true,
        scrollController: props['scrollController'],
        scrollPhysics: props['scrollPhysics'],
        autocorrectionTextRectColor: props['autocorrectionTextRectColor'],
        toolbarOptions: props['toolbarOptions'] ??
            const ToolbarOptions(
                copy: true, cut: true, paste: true, selectAll: true),
        autofillHints: props['autofillHints'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        restorationId: props['restorationId'],
      ),
  'EditableText.debugDeterministicCursor':
  EditableText.debugDeterministicCursor,
  'ErrorWidget': (props) =>
      ErrorWidget(
        props['pa'][0],
      ),
  'ErrorWidget.withDetails': (props) =>
      ErrorWidget.withDetails(
        message: props['message'] ?? '',
        error: props['error'],
      ),
  'ErrorWidget.builder': ErrorWidget.builder,
  'ExcludeFocus': (props) =>
      ExcludeFocus(
        key: props['key'],
        excluding: props['excluding'] ?? true,
        child: props['child'],
      ),
  'Focus': (props) =>
      Focus(
        key: props['key'],
        child: props['child'],
        focusNode: props['focusNode'],
        autofocus: props['autofocus'] ?? false,
        onFocusChange: props['onFocusChange'],
        onKey: props['onKey'],
        debugLabel: props['debugLabel'],
        canRequestFocus: props['canRequestFocus'],
        descendantsAreFocusable: props['descendantsAreFocusable'] ?? true,
        skipTraversal: props['skipTraversal'],
        includeSemantics: props['includeSemantics'] ?? true,
      ),
  'FocusScope': (props) =>
      FocusScope(
        key: props['key'],
        node: props['node'],
        child: props['child'],
        autofocus: props['autofocus'] ?? false,
        onFocusChange: props['onFocusChange'],
        canRequestFocus: props['canRequestFocus'],
        skipTraversal: props['skipTraversal'],
        onKey: props['onKey'],
        debugLabel: props['debugLabel'],
      ),
  'FadeInImage': (props) =>
      FadeInImage(
        key: props['key'],
        placeholder: props['placeholder'],
        placeholderErrorBuilder: props['placeholderErrorBuilder'],
        image: props['image'],
        imageErrorBuilder: props['imageErrorBuilder'],
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        imageSemanticLabel: props['imageSemanticLabel'],
        fadeOutDuration:
        props['fadeOutDuration'] ?? const Duration(milliseconds: 300),
        fadeOutCurve: props['fadeOutCurve'] ?? Curves.easeOut,
        fadeInDuration:
        props['fadeInDuration'] ?? const Duration(milliseconds: 700),
        fadeInCurve: props['fadeInCurve'] ?? Curves.easeIn,
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        fit: props['fit'],
        alignment: props['alignment'] ?? Alignment.center,
        repeat: props['repeat'] ?? ImageRepeat.noRepeat,
        matchTextDirection: props['matchTextDirection'] ?? false,
      ),
  'FadeInImage.memoryNetwork': (props) =>
      FadeInImage.memoryNetwork(
        key: props['key'],
        placeholder: props['placeholder'],
        placeholderErrorBuilder: props['placeholderErrorBuilder'],
        image: props['image'],
        imageErrorBuilder: props['imageErrorBuilder'],
        placeholderScale: props['placeholderScale']?.toDouble() ?? 1.0,
        imageScale: props['imageScale']?.toDouble() ?? 1.0,
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        imageSemanticLabel: props['imageSemanticLabel'],
        fadeOutDuration:
        props['fadeOutDuration'] ?? const Duration(milliseconds: 300),
        fadeOutCurve: props['fadeOutCurve'] ?? Curves.easeOut,
        fadeInDuration:
        props['fadeInDuration'] ?? const Duration(milliseconds: 700),
        fadeInCurve: props['fadeInCurve'] ?? Curves.easeIn,
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        fit: props['fit'],
        alignment: props['alignment'] ?? Alignment.center,
        repeat: props['repeat'] ?? ImageRepeat.noRepeat,
        matchTextDirection: props['matchTextDirection'] ?? false,
        placeholderCacheWidth: props['placeholderCacheWidth'],
        placeholderCacheHeight: props['placeholderCacheHeight'],
        imageCacheWidth: props['imageCacheWidth'],
        imageCacheHeight: props['imageCacheHeight'],
      ),
  'FadeInImage.assetNetwork': (props) =>
      FadeInImage.assetNetwork(
        key: props['key'],
        placeholder: props['placeholder'],
        placeholderErrorBuilder: props['placeholderErrorBuilder'],
        image: props['image'],
        imageErrorBuilder: props['imageErrorBuilder'],
        bundle: props['bundle'],
        placeholderScale: props['placeholderScale']?.toDouble() ?? 1.0,
        imageScale: props['imageScale']?.toDouble() ?? 1.0,
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        imageSemanticLabel: props['imageSemanticLabel'],
        fadeOutDuration:
        props['fadeOutDuration'] ?? const Duration(milliseconds: 300),
        fadeOutCurve: props['fadeOutCurve'] ?? Curves.easeOut,
        fadeInDuration:
        props['fadeInDuration'] ?? const Duration(milliseconds: 700),
        fadeInCurve: props['fadeInCurve'] ?? Curves.easeIn,
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        fit: props['fit'],
        alignment: props['alignment'] ?? Alignment.center,
        repeat: props['repeat'] ?? ImageRepeat.noRepeat,
        matchTextDirection: props['matchTextDirection'] ?? false,
        placeholderCacheWidth: props['placeholderCacheWidth'],
        placeholderCacheHeight: props['placeholderCacheHeight'],
        imageCacheWidth: props['imageCacheWidth'],
        imageCacheHeight: props['imageCacheHeight'],
      ),
  'FocusHighlightMode': {
    'values': FocusHighlightMode.values,
    'touch': FocusHighlightMode.touch,
    'traditional': FocusHighlightMode.traditional,
  },
  'FocusHighlightStrategy': {
    'values': FocusHighlightStrategy.values,
    'automatic': FocusHighlightStrategy.automatic,
    'alwaysTouch': FocusHighlightStrategy.alwaysTouch,
    'alwaysTraditional': FocusHighlightStrategy.alwaysTraditional,
  },
  'FocusManager': {
    'instance': FocusManager.instance,
  },
  'UnfocusDisposition': {
    'values': UnfocusDisposition.values,
    'scope': UnfocusDisposition.scope,
    'previouslyFocusedChild': UnfocusDisposition.previouslyFocusedChild,
  },
  'FocusTraversalGroup': (props) =>
      FocusTraversalGroup(
        key: props['key'],
        policy: props['policy'],
        descendantsAreFocusable: props['descendantsAreFocusable'] ?? true,
        child: props['child'],
      ),
  'FocusTraversalOrder': (props) =>
      FocusTraversalOrder(
        key: props['key'],
        order: props['order'],
        child: props['child'],
      ),
  'TraversalDirection': {
    'values': TraversalDirection.values,
    'up': TraversalDirection.up,
    'right': TraversalDirection.right,
    'down': TraversalDirection.down,
    'left': TraversalDirection.left,
  },
  'GestureDetector': (props) =>
      GestureDetector(
        key: props['key'],
        child: props['child'],
        onTapDown: props['onTapDown'],
        onTapUp: props['onTapUp'],
        onTap: props['onTap'],
        onTapCancel: props['onTapCancel'],
        onSecondaryTap: props['onSecondaryTap'],
        onSecondaryTapDown: props['onSecondaryTapDown'],
        onSecondaryTapUp: props['onSecondaryTapUp'],
        onSecondaryTapCancel: props['onSecondaryTapCancel'],
        onTertiaryTapDown: props['onTertiaryTapDown'],
        onTertiaryTapUp: props['onTertiaryTapUp'],
        onTertiaryTapCancel: props['onTertiaryTapCancel'],
        onDoubleTapDown: props['onDoubleTapDown'],
        onDoubleTap: props['onDoubleTap'],
        onDoubleTapCancel: props['onDoubleTapCancel'],
        onLongPress: props['onLongPress'],
        onLongPressStart: props['onLongPressStart'],
        onLongPressMoveUpdate: props['onLongPressMoveUpdate'],
        onLongPressUp: props['onLongPressUp'],
        onLongPressEnd: props['onLongPressEnd'],
        onSecondaryLongPress: props['onSecondaryLongPress'],
        onSecondaryLongPressStart: props['onSecondaryLongPressStart'],
        onSecondaryLongPressMoveUpdate:
        props['onSecondaryLongPressMoveUpdate'],
        onSecondaryLongPressUp: props['onSecondaryLongPressUp'],
        onSecondaryLongPressEnd: props['onSecondaryLongPressEnd'],
        onVerticalDragDown: props['onVerticalDragDown'],
        onVerticalDragStart: props['onVerticalDragStart'],
        onVerticalDragUpdate: props['onVerticalDragUpdate'],
        onVerticalDragEnd: props['onVerticalDragEnd'],
        onVerticalDragCancel: props['onVerticalDragCancel'],
        onHorizontalDragDown: props['onHorizontalDragDown'],
        onHorizontalDragStart: props['onHorizontalDragStart'],
        onHorizontalDragUpdate: props['onHorizontalDragUpdate'],
        onHorizontalDragEnd: props['onHorizontalDragEnd'],
        onHorizontalDragCancel: props['onHorizontalDragCancel'],
        onForcePressStart: props['onForcePressStart'],
        onForcePressPeak: props['onForcePressPeak'],
        onForcePressUpdate: props['onForcePressUpdate'],
        onForcePressEnd: props['onForcePressEnd'],
        onPanDown: props['onPanDown'],
        onPanStart: props['onPanStart'],
        onPanUpdate: props['onPanUpdate'],
        onPanEnd: props['onPanEnd'],
        onPanCancel: props['onPanCancel'],
        onScaleStart: props['onScaleStart'],
        onScaleUpdate: props['onScaleUpdate'],
        onScaleEnd: props['onScaleEnd'],
        behavior: props['behavior'],
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
      ),
  'RawGestureDetector': (props) =>
      RawGestureDetector(
        key: props['key'],
        child: props['child'],
        gestures:
        props['gestures'] ?? const <Type, GestureRecognizerFactory>{},
        behavior: props['behavior'],
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        semantics: props['semantics'],
      ),
  'GlowingOverscrollIndicator': (props) =>
      GlowingOverscrollIndicator(
        key: props['key'],
        showLeading: props['showLeading'] ?? true,
        showTrailing: props['showTrailing'] ?? true,
        axisDirection: props['axisDirection'],
        color: props['color'],
        notificationPredicate: props['notificationPredicate'] ??
            defaultScrollNotificationPredicate,
        child: props['child'],
      ),
  'GridPaper': (props) =>
      GridPaper(
        key: props['key'],
        color: props['color'] ?? const Color(0x7FC3E8F3),
        interval: props['interval']?.toDouble() ?? 100.0,
        divisions: props['divisions'] ?? 2,
        subdivisions: props['subdivisions'] ?? 5,
        child: props['child'],
      ),
  'Hero': (props) =>
      Hero(
        key: props['key'],
        tag: props['tag'],
        createRectTween: props['createRectTween'],
        flightShuttleBuilder: props['flightShuttleBuilder'],
        placeholderBuilder: props['placeholderBuilder'],
        transitionOnUserGestures:
        props['transitionOnUserGestures'] ?? false,
        child: props['child'],
      ),
  'HeroFlightDirection': {
    'values': HeroFlightDirection.values,
    'push': HeroFlightDirection.push,
    'pop': HeroFlightDirection.pop,
  },
  'HeroControllerScope': (props) =>
      HeroControllerScope(
        key: props['key'],
        controller: props['controller'],
        child: props['child'],
      ),
  'HeroControllerScope.none': (props) =>
      HeroControllerScope.none(
        key: props['key'],
        child: props['child'],
      ),
  'Navigator': (props) =>
      Navigator(
        key: props['key'],
        pages: props['pages'] ?? const <Page<dynamic>>[],
        onPopPage: props['onPopPage'],
        initialRoute: props['initialRoute'],
        onGenerateInitialRoutes: props['onGenerateInitialRoutes'] ??
            Navigator.defaultGenerateInitialRoutes,
        onGenerateRoute: props['onGenerateRoute'],
        onUnknownRoute: props['onUnknownRoute'],
        transitionDelegate: props['transitionDelegate'] ??
            const DefaultTransitionDelegate<dynamic>(),
        reportsRouteUpdateToEngine:
        props['reportsRouteUpdateToEngine'] ?? false,
        observers: props['observers'] ?? const <NavigatorObserver>[],
      ),
  'Navigator.defaultRouteName': Navigator.defaultRouteName,
  'RoutePopDisposition': {
    'values': RoutePopDisposition.values,
    'pop': RoutePopDisposition.pop,
    'doNotPop': RoutePopDisposition.doNotPop,
    'bubble': RoutePopDisposition.bubble,
  },
  'Icon': (props) =>
      Icon(
        props['pa'][0],
        key: props['key'],
        size: props['size']?.toDouble(),
        color: props['color'],
        semanticLabel: props['semanticLabel'],
        textDirection: props['textDirection'],
      ),
  'IconTheme': (props) =>
      IconTheme(
        key: props['key'],
        data: props['data'],
        child: props['child'],
      ),
  'Image': (props) =>
      Image(
        key: props['key'],
        image: props['image'],
        frameBuilder: props['frameBuilder'],
        loadingBuilder: props['loadingBuilder'],
        errorBuilder: props['errorBuilder'],
        semanticLabel: props['semanticLabel'],
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        color: props['color'],
        colorBlendMode: props['colorBlendMode'],
        fit: props['fit'],
        alignment: props['alignment'] ?? Alignment.center,
        repeat: props['repeat'] ?? ImageRepeat.noRepeat,
        centerSlice: props['centerSlice'],
        matchTextDirection: props['matchTextDirection'] ?? false,
        gaplessPlayback: props['gaplessPlayback'] ?? false,
        isAntiAlias: props['isAntiAlias'] ?? false,
        filterQuality: props['filterQuality'] ?? FilterQuality.low,
      ),
  'Image.network': (props) =>
      Image.network(
        props['pa'][0],
        key: props['key'],
        scale: props['scale']?.toDouble() ?? 1.0,
        frameBuilder: props['frameBuilder'],
        loadingBuilder: props['loadingBuilder'],
        errorBuilder: props['errorBuilder'],
        semanticLabel: props['semanticLabel'],
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        color: props['color'],
        colorBlendMode: props['colorBlendMode'],
        fit: props['fit'],
        alignment: props['alignment'] ?? Alignment.center,
        repeat: props['repeat'] ?? ImageRepeat.noRepeat,
        centerSlice: props['centerSlice'],
        matchTextDirection: props['matchTextDirection'] ?? false,
        gaplessPlayback: props['gaplessPlayback'] ?? false,
        filterQuality: props['filterQuality'] ?? FilterQuality.low,
        isAntiAlias: props['isAntiAlias'] ?? false,
        headers: props['headers'],
        cacheWidth: props['cacheWidth'],
        cacheHeight: props['cacheHeight'],
      ),
  'File': (props) => File(props['pa'][0]),
  'Image.file': (props) =>
      Image.file(
        props['pa'][0],
        key: props['key'],
        scale: props['scale']?.toDouble() ?? 1.0,
        frameBuilder: props['frameBuilder'],
        errorBuilder: props['errorBuilder'],
        semanticLabel: props['semanticLabel'],
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        color: props['color'],
        colorBlendMode: props['colorBlendMode'],
        fit: props['fit'],
        alignment: props['alignment'] ?? Alignment.center,
        repeat: props['repeat'] ?? ImageRepeat.noRepeat,
        centerSlice: props['centerSlice'],
        matchTextDirection: props['matchTextDirection'] ?? false,
        gaplessPlayback: props['gaplessPlayback'] ?? false,
        isAntiAlias: props['isAntiAlias'] ?? false,
        filterQuality: props['filterQuality'] ?? FilterQuality.low,
        cacheWidth: props['cacheWidth'],
        cacheHeight: props['cacheHeight'],
      ),
  'Image.asset': (props) =>
      Image.asset(
        props['pa'][0],
        key: props['key'],
        bundle: props['bundle'],
        frameBuilder: props['frameBuilder'],
        errorBuilder: props['errorBuilder'],
        semanticLabel: props['semanticLabel'],
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        scale: props['scale']?.toDouble() ?? 1.0,
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        color: props['color'],
        colorBlendMode: props['colorBlendMode'],
        fit: props['fit'],
        alignment: props['alignment'] ?? Alignment.center,
        repeat: props['repeat'] ?? ImageRepeat.noRepeat,
        centerSlice: props['centerSlice'],
        matchTextDirection: props['matchTextDirection'] ?? false,
        gaplessPlayback: props['gaplessPlayback'] ?? false,
        isAntiAlias: props['isAntiAlias'] ?? false,
        package: props['package'],
        filterQuality: props['filterQuality'] ?? FilterQuality.low,
        cacheWidth: props['cacheWidth'],
        cacheHeight: props['cacheHeight'],
      ),
  'Image.memory': (props) =>
      Image.memory(
        props['pa'][0],
        key: props['key'],
        scale: props['scale']?.toDouble() ?? 1.0,
        frameBuilder: props['frameBuilder'],
        errorBuilder: props['errorBuilder'],
        semanticLabel: props['semanticLabel'],
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        width: props['width']?.toDouble(),
        height: props['height']?.toDouble(),
        color: props['color'],
        colorBlendMode: props['colorBlendMode'],
        fit: props['fit'],
        alignment: props['alignment'] ?? Alignment.center,
        repeat: props['repeat'] ?? ImageRepeat.noRepeat,
        centerSlice: props['centerSlice'],
        matchTextDirection: props['matchTextDirection'] ?? false,
        gaplessPlayback: props['gaplessPlayback'] ?? false,
        isAntiAlias: props['isAntiAlias'] ?? false,
        filterQuality: props['filterQuality'] ?? FilterQuality.low,
        cacheWidth: props['cacheWidth'],
        cacheHeight: props['cacheHeight'],
      ),
  'ImageFiltered': (props) =>
      ImageFiltered(
        key: props['key'],
        imageFilter: props['imageFilter'],
        child: props['child'],
      ),
  'ImageIcon': (props) =>
      ImageIcon(
        props['pa'][0],
        key: props['key'],
        size: props['size']?.toDouble(),
        color: props['color'],
        semanticLabel: props['semanticLabel'],
      ),
  'InteractiveViewer': (props) =>
      InteractiveViewer(
        key: props['key'],
        alignPanAxis: props['alignPanAxis'] ?? false,
        boundaryMargin: props['boundaryMargin'] ?? EdgeInsets.zero,
        constrained: props['constrained'] ?? true,
        maxScale: props['maxScale']?.toDouble() ?? 2.5,
        minScale: props['minScale']?.toDouble() ?? 0.8,
        onInteractionEnd: props['onInteractionEnd'],
        onInteractionStart: props['onInteractionStart'],
        onInteractionUpdate: props['onInteractionUpdate'],
        panEnabled: props['panEnabled'] ?? true,
        scaleEnabled: props['scaleEnabled'] ?? true,
        transformationController: props['transformationController'],
        child: props['child'],
      ),
  'KeepAlive': (props) =>
      KeepAlive(
        key: props['key'],
        keepAlive: props['keepAlive'],
        child: props['child'],
      ),
  'SliverChildBuilderDelegate': (props) =>
      SliverChildBuilderDelegate(
        props['pa'][0],
        findChildIndexCallback: props['findChildIndexCallback'],
        childCount: props['childCount'],
        addAutomaticKeepAlives: props['addAutomaticKeepAlives'] ?? true,
        addRepaintBoundaries: props['addRepaintBoundaries'] ?? true,
        addSemanticIndexes: props['addSemanticIndexes'] ?? true,
        semanticIndexCallback: props['semanticIndexCallback'] ??
            _kDefaultSemanticIndexCallback,
        semanticIndexOffset: props['semanticIndexOffset'] ?? 0,
      ),
  'SliverChildListDelegate': (props) =>
      SliverChildListDelegate(
        props['pa'][0],
        addAutomaticKeepAlives: props['addAutomaticKeepAlives'] ?? true,
        addRepaintBoundaries: props['addRepaintBoundaries'] ?? true,
        addSemanticIndexes: props['addSemanticIndexes'] ?? true,
        semanticIndexCallback: props['semanticIndexCallback'] ??
            _kDefaultSemanticIndexCallback,
        semanticIndexOffset: props['semanticIndexOffset'] ?? 0,
      ),
  'SliverChildListDelegate.fixed': (props) =>
      SliverChildListDelegate.fixed(
        props['pa'][0],
        addAutomaticKeepAlives: props['addAutomaticKeepAlives'] ?? true,
        addRepaintBoundaries: props['addRepaintBoundaries'] ?? true,
        addSemanticIndexes: props['addSemanticIndexes'] ?? true,
        semanticIndexCallback: props['semanticIndexCallback'] ??
            _kDefaultSemanticIndexCallback,
        semanticIndexOffset: props['semanticIndexOffset'] ?? 0,
      ),
  'SliverFixedExtentList': (props) =>
      SliverFixedExtentList(
        key: props['key'],
        delegate: props['delegate'],
        itemExtent: props['itemExtent']?.toDouble(),
      ),
  'SliverGrid': (props) =>
      SliverGrid(
        key: props['key'],
        delegate: props['delegate'],
        gridDelegate: props['gridDelegate'],
      ),
  'SliverGrid.count': (props) =>
      SliverGrid.count(
        key: props['key'],
        crossAxisCount: props['crossAxisCount'],
        mainAxisSpacing: props['mainAxisSpacing']?.toDouble() ?? 0.0,
        crossAxisSpacing: props['crossAxisSpacing']?.toDouble() ?? 0.0,
        childAspectRatio: props['childAspectRatio']?.toDouble() ?? 1.0,
        children: props['children'] ?? const <Widget>[],
      ),
  'SliverGrid.extent': (props) =>
      SliverGrid.extent(
        key: props['key'],
        maxCrossAxisExtent: props['maxCrossAxisExtent']?.toDouble(),
        mainAxisSpacing: props['mainAxisSpacing']?.toDouble() ?? 0.0,
        crossAxisSpacing: props['crossAxisSpacing']?.toDouble() ?? 0.0,
        childAspectRatio: props['childAspectRatio']?.toDouble() ?? 1.0,
        children: props['children'] ?? const <Widget>[],
      ),
  'SliverIgnorePointer': (props) =>
      SliverIgnorePointer(
        key: props['key'],
        ignoring: props['ignoring'] ?? true,
        ignoringSemantics: props['ignoringSemantics'],
        sliver: props['sliver'],
      ),
  'SliverList': (props) =>
      SliverList(
        key: props['key'],
        delegate: props['delegate'],
      ),
  'SliverOffstage': (props) =>
      SliverOffstage(
        key: props['key'],
        offstage: props['offstage'] ?? true,
        sliver: props['sliver'],
      ),
  'SliverOpacity': (props) =>
      SliverOpacity(
        key: props['key'],
        opacity: props['opacity']?.toDouble(),
        alwaysIncludeSemantics: props['alwaysIncludeSemantics'] ?? false,
        sliver: props['sliver'],
      ),
  'LayoutBuilder': (props) =>
      LayoutBuilder(
        key: props['key'],
        builder: props['builder'],
      ),
  'ListWheelScrollView': (props) =>
      ListWheelScrollView(
        key: props['key'],
        controller: props['controller'],
        physics: props['physics'],
        diameterRatio: props['diameterRatio']?.toDouble() ??
            RenderListWheelViewport.defaultDiameterRatio,
        perspective: props['perspective']?.toDouble() ??
            RenderListWheelViewport.defaultPerspective,
        offAxisFraction: props['offAxisFraction']?.toDouble() ?? 0.0,
        useMagnifier: props['useMagnifier'] ?? false,
        magnification: props['magnification']?.toDouble() ?? 1.0,
        overAndUnderCenterOpacity:
        props['overAndUnderCenterOpacity']?.toDouble() ?? 1.0,
        itemExtent: props['itemExtent']?.toDouble(),
        squeeze: props['squeeze']?.toDouble() ?? 1.0,
        onSelectedItemChanged: props['onSelectedItemChanged'],
        renderChildrenOutsideViewport:
        props['renderChildrenOutsideViewport'] ?? false,
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        restorationId: props['restorationId'],
        children: as<Widget>(props['children']),
      ),
  'ListWheelScrollView.useDelegate': (props) =>
      ListWheelScrollView.useDelegate(
        key: props['key'],
        controller: props['controller'],
        physics: props['physics'],
        diameterRatio: props['diameterRatio']?.toDouble() ??
            RenderListWheelViewport.defaultDiameterRatio,
        perspective: props['perspective']?.toDouble() ??
            RenderListWheelViewport.defaultPerspective,
        offAxisFraction: props['offAxisFraction']?.toDouble() ?? 0.0,
        useMagnifier: props['useMagnifier'] ?? false,
        magnification: props['magnification']?.toDouble() ?? 1.0,
        overAndUnderCenterOpacity:
        props['overAndUnderCenterOpacity']?.toDouble() ?? 1.0,
        itemExtent: props['itemExtent']?.toDouble(),
        squeeze: props['squeeze']?.toDouble() ?? 1.0,
        onSelectedItemChanged: props['onSelectedItemChanged'],
        renderChildrenOutsideViewport:
        props['renderChildrenOutsideViewport'] ?? false,
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        restorationId: props['restorationId'],
        childDelegate: props['childDelegate'],
      ),
  'ListWheelViewport': (props) =>
      ListWheelViewport(
        key: props['key'],
        diameterRatio: props['diameterRatio']?.toDouble() ??
            RenderListWheelViewport.defaultDiameterRatio,
        perspective: props['perspective']?.toDouble() ??
            RenderListWheelViewport.defaultPerspective,
        offAxisFraction: props['offAxisFraction']?.toDouble() ?? 0.0,
        useMagnifier: props['useMagnifier'] ?? false,
        magnification: props['magnification']?.toDouble() ?? 1.0,
        overAndUnderCenterOpacity:
        props['overAndUnderCenterOpacity']?.toDouble() ?? 1.0,
        itemExtent: props['itemExtent']?.toDouble(),
        squeeze: props['squeeze']?.toDouble() ?? 1.0,
        renderChildrenOutsideViewport:
        props['renderChildrenOutsideViewport'] ?? false,
        offset: props['offset'],
        childDelegate: props['childDelegate'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'MediaQuery': (props) =>
      MediaQuery(
        key: props['key'],
        data: props['data'],
        child: props['child'],
      ),
  'MediaQuery.removePadding': (props) =>
      MediaQuery.removePadding(
        key: props['key'],
        context: props['context'],
        removeLeft: props['removeLeft'] ?? false,
        removeTop: props['removeTop'] ?? false,
        removeRight: props['removeRight'] ?? false,
        removeBottom: props['removeBottom'] ?? false,
        child: props['child'],
      ),
  'MediaQuery.removeViewInsets': (props) =>
      MediaQuery.removeViewInsets(
        key: props['key'],
        context: props['context'],
        removeLeft: props['removeLeft'] ?? false,
        removeTop: props['removeTop'] ?? false,
        removeRight: props['removeRight'] ?? false,
        removeBottom: props['removeBottom'] ?? false,
        child: props['child'],
      ),
  'MediaQuery.removeViewPadding': (props) =>
      MediaQuery.removeViewPadding(
        key: props['key'],
        context: props['context'],
        removeLeft: props['removeLeft'] ?? false,
        removeTop: props['removeTop'] ?? false,
        removeRight: props['removeRight'] ?? false,
        removeBottom: props['removeBottom'] ?? false,
        child: props['child'],
      ),
  'NavigationMode': {
    'values': NavigationMode.values,
    'traditional': NavigationMode.traditional,
    'directional': NavigationMode.directional,
  },
  'Orientation': {
    'values': Orientation.values,
    'portrait': Orientation.portrait,
    'landscape': Orientation.landscape,
  },
  'NavigationToolbar': (props) =>
      NavigationToolbar(
        key: props['key'],
        leading: props['leading'],
        middle: props['middle'],
        trailing: props['trailing'],
        centerMiddle: props['centerMiddle'] ?? true,
        middleSpacing: props['middleSpacing']?.toDouble() ?? kMiddleSpacing,
      ),
  'NavigationToolbar.kMiddleSpacing': NavigationToolbar.kMiddleSpacing,
  'NestedScrollView': (props) =>
      NestedScrollView(
        key: props['key'],
        controller: props['controller'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        physics: props['physics'],
        headerSliverBuilder: props['headerSliverBuilder'],
        body: props['body'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        floatHeaderSlivers: props['floatHeaderSlivers'] ?? false,
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        restorationId: props['restorationId'],
      ),
  'NestedScrollViewViewport': (props) =>
      NestedScrollViewViewport(
        key: props['key'],
        axisDirection: props['axisDirection'] ?? AxisDirection.down,
        crossAxisDirection: props['crossAxisDirection'],
        anchor: props['anchor']?.toDouble() ?? 0.0,
        offset: props['offset'],
        center: props['center'],
        slivers: props['slivers'] ?? const <Widget>[],
        handle: props['handle'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'SliverOverlapAbsorber': (props) =>
      SliverOverlapAbsorber(
        key: props['key'],
        handle: props['handle'],
        sliver: props['sliver'],
      ),
  'SliverOverlapInjector': (props) =>
      SliverOverlapInjector(
        key: props['key'],
        handle: props['handle'],
        sliver: props['sliver'],
      ),
  'NotificationListener': (props) =>
      NotificationListener(
        key: props['key'],
        child: props['child'],
        onNotification: props['onNotification'],
      ),
  'OrientationBuilder': (props) =>
      OrientationBuilder(
        key: props['key'],
        builder: props['builder'],
      ),
  'OverflowBar': (props) =>
      OverflowBar(
        key: props['key'],
        spacing: props['spacing']?.toDouble() ?? 0.0,
        overflowSpacing: props['overflowSpacing']?.toDouble() ?? 0.0,
        overflowAlignment:
        props['overflowAlignment'] ?? OverflowBarAlignment.start,
        overflowDirection:
        props['overflowDirection'] ?? VerticalDirection.down,
        textDirection: props['textDirection'],
        clipBehavior: props['clipBehavior'] ?? Clip.none,
        children: props['children'] ?? const <Widget>[],
      ),
  'OverflowBarAlignment': {
    'values': OverflowBarAlignment.values,
    'start': OverflowBarAlignment.start,
    'end': OverflowBarAlignment.end,
    'center': OverflowBarAlignment.center,
  },
  'Overlay': (props) =>
      Overlay(
        key: props['key'],
        initialEntries: props['initialEntries'] ?? const <OverlayEntry>[],
      ),
  'PageStorage': (props) =>
      PageStorage(
        key: props['key'],
        bucket: props['bucket'],
        child: props['child'],
      ),
  'PageView': (props) =>
      PageView(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.horizontal,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        physics: props['physics'],
        pageSnapping: props['pageSnapping'] ?? true,
        onPageChanged: props['onPageChanged'],
        children: props['children'] ?? const <Widget>[],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        allowImplicitScrolling: props['allowImplicitScrolling'] ?? false,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'PageView.builder': (props) =>
      PageView.builder(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.horizontal,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        physics: props['physics'],
        pageSnapping: props['pageSnapping'] ?? true,
        onPageChanged: props['onPageChanged'],
        itemBuilder: props['itemBuilder'],
        itemCount: props['itemCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        allowImplicitScrolling: props['allowImplicitScrolling'] ?? false,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'PageView.custom': (props) =>
      PageView.custom(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.horizontal,
        reverse: props['reverse'] ?? false,
        controller: props['controller'],
        physics: props['physics'],
        pageSnapping: props['pageSnapping'] ?? true,
        onPageChanged: props['onPageChanged'],
        childrenDelegate: props['childrenDelegate'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        allowImplicitScrolling: props['allowImplicitScrolling'] ?? false,
        restorationId: props['restorationId'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
      ),
  'Placeholder': (props) =>
      Placeholder(
        key: props['key'],
        color: props['color'] ?? const Color(0xFF455A64),
        strokeWidth: props['strokeWidth']?.toDouble() ?? 2.0,
        fallbackWidth: props['fallbackWidth']?.toDouble() ?? 400.0,
        fallbackHeight: props['fallbackHeight']?.toDouble() ?? 400.0,
      ),
  'PreferredSize': (props) =>
      PreferredSize(
        key: props['key'],
        child: props['child'],
        preferredSize: props['preferredSize'],
      ),
  'PrimaryScrollController': (props) =>
      PrimaryScrollController(
        key: props['key'],
        controller: props['controller'],
        child: props['child'],
      ),
  'PrimaryScrollController.none': (props) =>
      PrimaryScrollController.none(
        key: props['key'],
        child: props['child'],
      ),
  'RawKeyboardListener': (props) =>
      RawKeyboardListener(
        key: props['key'],
        focusNode: props['focusNode'],
        autofocus: props['autofocus'] ?? false,
        includeSemantics: props['includeSemantics'] ?? true,
        onKey: props['onKey'],
        child: props['child'],
      ),
  'RenderObjectToWidgetAdapter': (props) =>
      RenderObjectToWidgetAdapter(
        child: props['child'],
        container: props['container'],
        debugShortDescription: props['debugShortDescription'],
      ),
  'RestorationScope': (props) =>
      RestorationScope(
        key: props['key'],
        restorationId: props['restorationId'],
        child: props['child'],
      ),
  'RootRestorationScope': (props) =>
      RootRestorationScope(
        key: props['key'],
        restorationId: props['restorationId'],
        child: props['child'],
      ),
  'UnmanagedRestorationScope': (props) =>
      UnmanagedRestorationScope(
        key: props['key'],
        bucket: props['bucket'],
        child: props['child'],
      ),
  'Router': (props) =>
      Router(
        key: props['key'],
        routeInformationProvider: props['routeInformationProvider'],
        routeInformationParser: props['routeInformationParser'],
        routerDelegate: props['routerDelegate'],
        backButtonDispatcher: props['backButtonDispatcher'],
      ),
  'SafeArea': (props) =>
      SafeArea(
        key: props['key'],
        left: props['left'] ?? true,
        top: props['top'] ?? true,
        right: props['right'] ?? true,
        bottom: props['bottom'] ?? true,
        minimum: props['minimum'] ?? EdgeInsets.zero,
        maintainBottomViewPadding:
        props['maintainBottomViewPadding'] ?? false,
        child: props['child'],
      ),
  'SliverSafeArea': (props) =>
      SliverSafeArea(
        key: props['key'],
        left: props['left'] ?? true,
        top: props['top'] ?? true,
        right: props['right'] ?? true,
        bottom: props['bottom'] ?? true,
        minimum: props['minimum'] ?? EdgeInsets.zero,
        sliver: props['sliver'],
      ),
  'ScrollConfiguration': (props) =>
      ScrollConfiguration(
        key: props['key'],
        behavior: props['behavior'],
        child: props['child'],
      ),
  'ScrollDragController': {
    'momentumRetainStationaryDurationThreshold':
    ScrollDragController.momentumRetainStationaryDurationThreshold,
    'motionStoppedDurationThreshold':
    ScrollDragController.motionStoppedDurationThreshold,
  },
  'ScrollIncrementType': {
    'values': ScrollIncrementType.values,
    'line': ScrollIncrementType.line,
    'page': ScrollIncrementType.page,
  },
  'Scrollable': (props) =>
      Scrollable(
        key: props['key'],
        axisDirection: props['axisDirection'] ?? AxisDirection.down,
        controller: props['controller'],
        physics: props['physics'],
        viewportBuilder: props['viewportBuilder'],
        incrementCalculator: props['incrementCalculator'],
        excludeFromSemantics: props['excludeFromSemantics'] ?? false,
        semanticChildCount: props['semanticChildCount'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        restorationId: props['restorationId'],
      ),
  'ScrollPositionAlignmentPolicy': {
    'values': ScrollPositionAlignmentPolicy.values,
    'explicit': ScrollPositionAlignmentPolicy.explicit,
    'keepVisibleAtEnd': ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
    'keepVisibleAtStart': ScrollPositionAlignmentPolicy.keepVisibleAtStart,
  },
  'SemanticsDebugger': (props) =>
      SemanticsDebugger(
        key: props['key'],
        child: props['child'],
        labelStyle: props['labelStyle'] ??
            const TextStyle(
                color: Color(0xFF000000), fontSize: 10.0, height: 0.8),
      ),
  'Shortcuts': (props) =>
      Shortcuts(
        key: props['key'],
        manager: props['manager'],
        shortcuts: props['shortcuts'],
        child: props['child'],
        debugLabel: props['debugLabel'],
      ),
  'ShrinkWrappingViewport': (props) =>
      ShrinkWrappingViewport(
        key: props['key'],
        axisDirection: props['axisDirection'] ?? AxisDirection.down,
        crossAxisDirection: props['crossAxisDirection'],
        offset: props['offset'],
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        slivers: props['slivers'] ?? const <Widget>[],
      ),
  'Viewport': (props) =>
      Viewport(
        key: props['key'],
        axisDirection: props['axisDirection'] ?? AxisDirection.down,
        crossAxisDirection: props['crossAxisDirection'],
        anchor: props['anchor']?.toDouble() ?? 0.0,
        offset: props['offset'],
        center: props['center'],
        cacheExtent: props['cacheExtent']?.toDouble(),
        cacheExtentStyle:
        props['cacheExtentStyle'] ?? CacheExtentStyle.pixel,
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        slivers: props['slivers'] ?? const <Widget>[],
      ),
  'SingleChildScrollView': (props) =>
      SingleChildScrollView(
        key: props['key'],
        scrollDirection: props['scrollDirection'] ?? Axis.vertical,
        reverse: props['reverse'] ?? false,
        padding: props['padding'],
        primary: props['primary'],
        physics: props['physics'],
        controller: props['controller'],
        child: props['child'],
        dragStartBehavior:
        props['dragStartBehavior'] ?? DragStartBehavior.start,
        clipBehavior: props['clipBehavior'] ?? Clip.hardEdge,
        restorationId: props['restorationId'],
      ),
  'SizeChangedLayoutNotifier': (props) =>
      SizeChangedLayoutNotifier(
        key: props['key'],
        child: props['child'],
      ),
  'SliverFillRemaining': (props) =>
      SliverFillRemaining(
        key: props['key'],
        child: props['child'],
        hasScrollBody: props['hasScrollBody'] ?? true,
        fillOverscroll: props['fillOverscroll'] ?? false,
      ),
  'SliverFillViewport': (props) =>
      SliverFillViewport(
        key: props['key'],
        delegate: props['delegate'],
        viewportFraction: props['viewportFraction']?.toDouble() ?? 1.0,
        padEnds: props['padEnds'] ?? true,
      ),
  'SliverLayoutBuilder': (props) =>
      SliverLayoutBuilder(
        key: props['key'],
        builder: props['builder'],
      ),
  'SliverPersistentHeader': (props) =>
      SliverPersistentHeader(
        key: props['key'],
        delegate: props['delegate'],
        pinned: props['pinned'] ?? false,
        floating: props['floating'] ?? false,
      ),
  'SliverPrototypeExtentList': (props) =>
      SliverPrototypeExtentList(
        key: props['key'],
        delegate: props['delegate'],
        prototypeItem: props['prototypeItem'],
      ),
  'SliverVisibility': (props) =>
      SliverVisibility(
        key: props['key'],
        sliver: props['sliver'],
        replacementSliver:
        props['replacementSliver'] ?? const SliverToBoxAdapter(),
        visible: props['visible'] ?? true,
        maintainState: props['maintainState'] ?? false,
        maintainAnimation: props['maintainAnimation'] ?? false,
        maintainSize: props['maintainSize'] ?? false,
        maintainSemantics: props['maintainSemantics'] ?? false,
        maintainInteractivity: props['maintainInteractivity'] ?? false,
      ),
  'Visibility': (props) =>
      Visibility(
        key: props['key'],
        child: props['child'],
        replacement: props['replacement'] ?? const SizedBox.shrink(),
        visible: props['visible'] ?? true,
        maintainState: props['maintainState'] ?? false,
        maintainAnimation: props['maintainAnimation'] ?? false,
        maintainSize: props['maintainSize'] ?? false,
        maintainSemantics: props['maintainSemantics'] ?? false,
        maintainInteractivity: props['maintainInteractivity'] ?? false,
      ),
  'Spacer': (props) =>
      Spacer(
        key: props['key'],
        flex: props['flex'] ?? 1,
      ),
  'Table': (props) =>
      Table(
        key: props['key'],
        children: props['children'] ?? const <TableRow>[],
        columnWidths: props['columnWidths'],
        defaultColumnWidth:
        props['defaultColumnWidth'] ?? const FlexColumnWidth(1.0),
        textDirection: props['textDirection'],
        border: props['border'],
        defaultVerticalAlignment: props['defaultVerticalAlignment'] ??
            TableCellVerticalAlignment.top,
        textBaseline: props['textBaseline'] ?? TextBaseline.alphabetic,
      ),
  'TableCell': (props) =>
      TableCell(
        key: props['key'],
        verticalAlignment: props['verticalAlignment'],
        child: props['child'],
      ),
  'Texture': (props) =>
      Texture(
        key: props['key'],
        textureId: props['textureId'],
        filterQuality: props['filterQuality'] ?? FilterQuality.low,
      ),
  'TickerMode': (props) =>
      TickerMode(
        key: props['key'],
        enabled: props['enabled'],
        child: props['child'],
      ),
  'Title': (props) =>
      Title(
        key: props['key'],
        title: props['title'] ?? '',
        color: props['color'],
        child: props['child'],
      ),
  'TweenAnimationBuilder': (props) =>
      TweenAnimationBuilder(
        key: props['key'],
        tween: props['tween'],
        duration: props['duration'],
        curve: props['curve'] ?? Curves.linear,
        builder: props['builder'],
        onEnd: props['onEnd'],
        child: props['child'],
      ),
  'ValueListenableBuilder': (props) =>
      ValueListenableBuilder(
        key: props['key'],
        valueListenable: props['valueListenable'],
        builder: props['builder'],
        child: props['child'],
      ),
  'WidgetsApp': (props) =>
      WidgetsApp(
        key: props['key'],
        navigatorKey: props['navigatorKey'],
        onGenerateRoute: props['onGenerateRoute'],
        onGenerateInitialRoutes: props['onGenerateInitialRoutes'],
        onUnknownRoute: props['onUnknownRoute'],
        navigatorObservers:
        props['navigatorObservers'] ?? const <NavigatorObserver>[],
        initialRoute: props['initialRoute'],
        pageRouteBuilder: props['pageRouteBuilder'],
        home: props['home'],
        routes: props['routes'] ?? const <String, WidgetBuilder>{},
        builder: props['builder'],
        title: props['title'] ?? '',
        onGenerateTitle: props['onGenerateTitle'],
        textStyle: props['textStyle'],
        color: props['color'],
        locale: props['locale'],
        localizationsDelegates: props['localizationsDelegates'],
        localeListResolutionCallback: props['localeListResolutionCallback'],
        localeResolutionCallback: props['localeResolutionCallback'],
        supportedLocales:
        props['supportedLocales'] ?? const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay: props['showPerformanceOverlay'] ?? false,
        checkerboardRasterCacheImages:
        props['checkerboardRasterCacheImages'] ?? false,
        checkerboardOffscreenLayers:
        props['checkerboardOffscreenLayers'] ?? false,
        showSemanticsDebugger: props['showSemanticsDebugger'] ?? false,
        debugShowWidgetInspector:
        props['debugShowWidgetInspector'] ?? false,
        debugShowCheckedModeBanner:
        props['debugShowCheckedModeBanner'] ?? true,
        inspectorSelectButtonBuilder: props['inspectorSelectButtonBuilder'],
        shortcuts: props['shortcuts'],
        actions: props['actions'],
      ),
  'WidgetsApp.router': (props) =>
      WidgetsApp.router(
        key: props['key'],
        routeInformationProvider: props['routeInformationProvider'],
        routeInformationParser: props['routeInformationParser'],
        routerDelegate: props['routerDelegate'],
        backButtonDispatcher: props['backButtonDispatcher'],
        builder: props['builder'],
        title: props['title'] ?? '',
        onGenerateTitle: props['onGenerateTitle'],
        textStyle: props['textStyle'],
        color: props['color'],
        locale: props['locale'],
        localizationsDelegates: props['localizationsDelegates'],
        localeListResolutionCallback: props['localeListResolutionCallback'],
        localeResolutionCallback: props['localeResolutionCallback'],
        supportedLocales:
        props['supportedLocales'] ?? const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay: props['showPerformanceOverlay'] ?? false,
        checkerboardRasterCacheImages:
        props['checkerboardRasterCacheImages'] ?? false,
        checkerboardOffscreenLayers:
        props['checkerboardOffscreenLayers'] ?? false,
        showSemanticsDebugger: props['showSemanticsDebugger'] ?? false,
        debugShowWidgetInspector:
        props['debugShowWidgetInspector'] ?? false,
        debugShowCheckedModeBanner:
        props['debugShowCheckedModeBanner'] ?? true,
        inspectorSelectButtonBuilder: props['inspectorSelectButtonBuilder'],
        shortcuts: props['shortcuts'],
        actions: props['actions'],
      ),
  'WidgetsApp.showPerformanceOverlayOverride':
  WidgetsApp.showPerformanceOverlayOverride,
  'WidgetsApp.debugShowWidgetInspectorOverride':
  WidgetsApp.debugShowWidgetInspectorOverride,
  'WidgetsApp.debugAllowBannerOverride':
  WidgetsApp.debugAllowBannerOverride,
  'WidgetsApp.defaultActions': WidgetsApp.defaultActions,
  'WidgetsApp.defaultShortcuts': WidgetsApp.defaultShortcuts,
  'WillPopScope': (props) =>
      WillPopScope(
        key: props['key'],
        child: props['child'],
        onWillPop: props['onWillPop'],
      ),
  'StoreConnector': (props) =>
      StoreConnector(
        key: props['key'],
        builder: props['builder'],
        converter: props['converter'],
        distinct: props['distinct'],
        onInit: props['onInit'],
        onDispose: props['onDispose'],
        rebuildOnChange: props['rebuildOnChange'] ?? true,
        ignoreChange: props['ignoreChange'],
        onWillChange: props['onWillChange'],
        onDidChange: props['onDidChange'],
        onInitialBuild: props['onInitialBuild'],
      ),
  '(BuildContext, dynamic) => Scaffold': (props) =>
      (BuildContext context, dynamic state) {
    return Scaffold(
      appBar: AppBar(
        title: Text("123"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                  '321'
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  },
};
