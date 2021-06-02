	Qsys u0 (
		.alt_vip_itc_0_clocked_video_vid_clk                    (<connected-to-alt_vip_itc_0_clocked_video_vid_clk>),                    //            alt_vip_itc_0_clocked_video.vid_clk
		.alt_vip_itc_0_clocked_video_vid_data                   (<connected-to-alt_vip_itc_0_clocked_video_vid_data>),                   //                                       .vid_data
		.alt_vip_itc_0_clocked_video_underflow                  (<connected-to-alt_vip_itc_0_clocked_video_underflow>),                  //                                       .underflow
		.alt_vip_itc_0_clocked_video_vid_datavalid              (<connected-to-alt_vip_itc_0_clocked_video_vid_datavalid>),              //                                       .vid_datavalid
		.alt_vip_itc_0_clocked_video_vid_v_sync                 (<connected-to-alt_vip_itc_0_clocked_video_vid_v_sync>),                 //                                       .vid_v_sync
		.alt_vip_itc_0_clocked_video_vid_h_sync                 (<connected-to-alt_vip_itc_0_clocked_video_vid_h_sync>),                 //                                       .vid_h_sync
		.alt_vip_itc_0_clocked_video_vid_f                      (<connected-to-alt_vip_itc_0_clocked_video_vid_f>),                      //                                       .vid_f
		.alt_vip_itc_0_clocked_video_vid_h                      (<connected-to-alt_vip_itc_0_clocked_video_vid_h>),                      //                                       .vid_h
		.alt_vip_itc_0_clocked_video_vid_v                      (<connected-to-alt_vip_itc_0_clocked_video_vid_v>),                      //                                       .vid_v
		.altpll_0_areset_conduit_export                         (<connected-to-altpll_0_areset_conduit_export>),                         //                altpll_0_areset_conduit.export
		.altpll_0_locked_conduit_export                         (<connected-to-altpll_0_locked_conduit_export>),                         //                altpll_0_locked_conduit.export
		.clk_clk                                                (<connected-to-clk_clk>),                                                //                                    clk.clk
		.clk_sdram_clk                                          (<connected-to-clk_sdram_clk>),                                          //                              clk_sdram.clk
		.clk_vga_clk                                            (<connected-to-clk_vga_clk>),                                            //                                clk_vga.clk
		.d8m_xclkin_clk                                         (<connected-to-d8m_xclkin_clk>),                                         //                             d8m_xclkin.clk
		.eee_imgproc_0_conduit_mode_new_signal                  (<connected-to-eee_imgproc_0_conduit_mode_new_signal>),                  //             eee_imgproc_0_conduit_mode.new_signal
		.eee_imgproc_0_conduit_mode_new_signal_1                (<connected-to-eee_imgproc_0_conduit_mode_new_signal_1>),                //                                       .new_signal_1
		.eee_imgproc_0_conduit_mode_new_signal_2                (<connected-to-eee_imgproc_0_conduit_mode_new_signal_2>),                //                                       .new_signal_2
		.i2c_opencores_camera_export_scl_pad_io                 (<connected-to-i2c_opencores_camera_export_scl_pad_io>),                 //            i2c_opencores_camera_export.scl_pad_io
		.i2c_opencores_camera_export_sda_pad_io                 (<connected-to-i2c_opencores_camera_export_sda_pad_io>),                 //                                       .sda_pad_io
		.i2c_opencores_mipi_export_scl_pad_io                   (<connected-to-i2c_opencores_mipi_export_scl_pad_io>),                   //              i2c_opencores_mipi_export.scl_pad_io
		.i2c_opencores_mipi_export_sda_pad_io                   (<connected-to-i2c_opencores_mipi_export_sda_pad_io>),                   //                                       .sda_pad_io
		.i2cslave_to_avlmm_bridge_0_conduit_end_conduit_data_in (<connected-to-i2cslave_to_avlmm_bridge_0_conduit_end_conduit_data_in>), // i2cslave_to_avlmm_bridge_0_conduit_end.conduit_data_in
		.i2cslave_to_avlmm_bridge_0_conduit_end_conduit_clk_in  (<connected-to-i2cslave_to_avlmm_bridge_0_conduit_end_conduit_clk_in>),  //                                       .conduit_clk_in
		.i2cslave_to_avlmm_bridge_0_conduit_end_conduit_data_oe (<connected-to-i2cslave_to_avlmm_bridge_0_conduit_end_conduit_data_oe>), //                                       .conduit_data_oe
		.i2cslave_to_avlmm_bridge_0_conduit_end_conduit_clk_oe  (<connected-to-i2cslave_to_avlmm_bridge_0_conduit_end_conduit_clk_oe>),  //                                       .conduit_clk_oe
		.key_external_connection_export                         (<connected-to-key_external_connection_export>),                         //                key_external_connection.export
		.led_external_connection_export                         (<connected-to-led_external_connection_export>),                         //                led_external_connection.export
		.mipi_pwdn_n_external_connection_export                 (<connected-to-mipi_pwdn_n_external_connection_export>),                 //        mipi_pwdn_n_external_connection.export
		.mipi_reset_n_external_connection_export                (<connected-to-mipi_reset_n_external_connection_export>),                //       mipi_reset_n_external_connection.export
		.reset_reset_n                                          (<connected-to-reset_reset_n>),                                          //                                  reset.reset_n
		.sdram_wire_addr                                        (<connected-to-sdram_wire_addr>),                                        //                             sdram_wire.addr
		.sdram_wire_ba                                          (<connected-to-sdram_wire_ba>),                                          //                                       .ba
		.sdram_wire_cas_n                                       (<connected-to-sdram_wire_cas_n>),                                       //                                       .cas_n
		.sdram_wire_cke                                         (<connected-to-sdram_wire_cke>),                                         //                                       .cke
		.sdram_wire_cs_n                                        (<connected-to-sdram_wire_cs_n>),                                        //                                       .cs_n
		.sdram_wire_dq                                          (<connected-to-sdram_wire_dq>),                                          //                                       .dq
		.sdram_wire_dqm                                         (<connected-to-sdram_wire_dqm>),                                         //                                       .dqm
		.sdram_wire_ras_n                                       (<connected-to-sdram_wire_ras_n>),                                       //                                       .ras_n
		.sdram_wire_we_n                                        (<connected-to-sdram_wire_we_n>),                                        //                                       .we_n
		.sw_external_connection_export                          (<connected-to-sw_external_connection_export>),                          //                 sw_external_connection.export
		.terasic_auto_focus_0_conduit_vcm_i2c_sda               (<connected-to-terasic_auto_focus_0_conduit_vcm_i2c_sda>),               //           terasic_auto_focus_0_conduit.vcm_i2c_sda
		.terasic_auto_focus_0_conduit_clk50                     (<connected-to-terasic_auto_focus_0_conduit_clk50>),                     //                                       .clk50
		.terasic_auto_focus_0_conduit_vcm_i2c_scl               (<connected-to-terasic_auto_focus_0_conduit_vcm_i2c_scl>),               //                                       .vcm_i2c_scl
		.terasic_camera_0_conduit_end_D                         (<connected-to-terasic_camera_0_conduit_end_D>),                         //           terasic_camera_0_conduit_end.D
		.terasic_camera_0_conduit_end_FVAL                      (<connected-to-terasic_camera_0_conduit_end_FVAL>),                      //                                       .FVAL
		.terasic_camera_0_conduit_end_LVAL                      (<connected-to-terasic_camera_0_conduit_end_LVAL>),                      //                                       .LVAL
		.terasic_camera_0_conduit_end_PIXCLK                    (<connected-to-terasic_camera_0_conduit_end_PIXCLK>)                     //                                       .PIXCLK
	);

