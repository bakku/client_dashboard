Dropzone.autoDiscover = false;

$(document).on("turbolinks:load", function() {
  if ($("#employees-dropzone").length == 0) return;

  Dropzone.options.employeesDropzone = {
    maxFiles: 1,
    autoProcessQueue: false,
    dictDefaultMessage: "Drop your Excel file here",
    init: function() {
      this.on("error", function(file, error) {
        $("#detailed-error").text("An error occurred during the upload. " + error.detail + ". Please fix the problem and try again.");
        $("#detailed-error").show();
        $("#modal-footer-idle").show();
        $("#modal-footer-uploading").hide();
      });

      this.on("success", function(file) {
        $("#import-modal-successful-body").show();
        $("#import-modal-uploading-body").hide();
        $("#modal-footer-idle").show();
        $("#modal-footer-uploading").hide();
        $("#import-modal-footer").hide();
      });

      this.on("addedfile", function() {
        $("#detailed-error").text("");
        $("#detailed-error").hide();
      });
    },
    maxfilesexceeded: function(file) {
      this.removeAllFiles();
      this.addFile(file);
    }
  };

  new Dropzone("#employees-dropzone");
});

$(document).on("turbolinks:load", function() {
  $("#import-modal").on("hidden.bs.modal", function() {
    Dropzone.forElement("#employees-dropzone").removeAllFiles();
    $("#detailed-error").hide();
    $("#import-modal-successful-body").hide();
    $("#import-modal-uploading-body").show();
    $("#modal-footer-idle").show();
    $("#modal-footer-uploading").hide();
    $("#import-modal-footer").show();
  });

  $("#import-modal-upload-btn").click(function() {
    Dropzone.forElement("#employees-dropzone").processQueue();

    $("#modal-footer-idle").hide();
    $("#modal-footer-uploading").show();
  });

  $("#import-modal-finish-button").click(function(event) {
    event.preventDefault();
    location.href = '/employees';
  });
});
