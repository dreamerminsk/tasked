class ClassDefItem {

final int classIdx;

final int accessFlags;

final int superclassIdx;

final int interfacesOff;

final int sourceFileIdx;

final int annotationsOff;

final int classDataOff;

final int staticValuesOff;


const ClassDefItem({
this.classIdx,
this.accessFlags,
this.superclassIdx,
this.interfacesOff,
this.sourceFileIdx,
this.annotationsOff,
this.classDataOff,
this.staticValuesOff,
});
}